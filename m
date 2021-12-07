Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD546C11B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0C97A330;
	Tue,  7 Dec 2021 16:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0057A330
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638896205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbZlHXLrH/KJuXxiNiEqP7XsRIdskxdthUk853zOUiw=;
 b=e2weVA2U8M6qw9Vu/T6kuO1zVvXuMsxrKAYe3w/2cUw0g8/LsLBppDUYk8Y1wLmyG1AHLG
 t+am2wGssaFsHu1RljqnqRYLr6UOo4RYZjZHkjWdJgEZs1gG012GJcsxj6VZtGaYRmCfW2
 Yl9gbdMT3AU+dAfRVHXEVsLWPKE1eXU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-ghXEGONROw6e46_2wV3IEw-1; Tue, 07 Dec 2021 11:56:44 -0500
X-MC-Unique: ghXEGONROw6e46_2wV3IEw-1
Received: by mail-ed1-f71.google.com with SMTP id
 t9-20020aa7d709000000b003e83403a5cbso12005611edq.19
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 08:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NbZlHXLrH/KJuXxiNiEqP7XsRIdskxdthUk853zOUiw=;
 b=Sax5HDlrRTHZr8YaM5/6J5jc0vCcpyPQAHZRi/Gyo2alz/4Wf9X75zBDsI178hwFeU
 yxcJTxjBBcUdkJRO6/LWiJGrLRP+qf3ZfnUUyM6brSrFd0QG9PH0YcIysWw8SVbniOZN
 jvS6ipQ6aaeaNlaZskBZ8vnrsgPm86bTnajqXgZbKGMTsFKE2VX1Rn13/iexQIfEu9tx
 IjVw5dnUZ6BSUcme78Liq/on7kV4S3xCnJy1tP8FxL+kciQPbXx796nl/mVSxhU6p94r
 BQpE85pu6txAthL2e7y2A3wqXtebscPka6acdjF7OlMleKsxcwhGALnxK9GO0DsqH9VY
 Kcag==
X-Gm-Message-State: AOAM531a9ShHKOpoyi/c8VXDQ3908bDmJw2qdAhg2edrLIa+Fs5Sxxsr
 40mYv0SPK5kn3vz71m7xEzJiJbLLSz2pN/hr6Bxv6UAvnJwsUMwkayeHhEV+6A4qMsGQW7FWsWv
 +AxbQ3xpbFxGaU7gKnPQWNkATjRRU
X-Received: by 2002:a05:6402:1e90:: with SMTP id
 f16mr10814703edf.91.1638896202411; 
 Tue, 07 Dec 2021 08:56:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWY5F2d+fnUAIHK7DKXb2eeQuC/2KAs3zfqQ8Bz4jxzk/E6I9ha/jg6dxz+Cfm3QS2MOTNmg==
X-Received: by 2002:a05:6402:1e90:: with SMTP id
 f16mr10814679edf.91.1638896202262; 
 Tue, 07 Dec 2021 08:56:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id w18sm197483edx.55.2021.12.07.08.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 08:56:41 -0800 (PST)
Message-ID: <1932c73c-e372-788b-fcbd-13cad52d96da@redhat.com>
Date: Tue, 7 Dec 2021 17:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC] drm/msm/dp: Allow attaching a drm_panel
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Imre Deak <imre.deak@intel.com>
References: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
 <YVumL1lHLqtb/HKS@ripper>
 <CAD=FV=W9uKq00wXn4H1ax0u2D=R8Wn3J-Je43uxcPyDtk7AK7Q@mail.gmail.com>
 <YVyMwsvLl6XalJxB@ripper>
 <CAD=FV=WY+g38p7--QKZCaQnSqx7VvdwC36jH-VKnrEWoxK=XHQ@mail.gmail.com>
 <YV0KBWxVtKgOp2Cj@ripper>
 <CAD=FV=X5JFE3u9BtxxocaUrYNSpYXJN90UJ8HOvXZE6oYiVsDQ@mail.gmail.com>
 <CACeCKac4b_ej87cQD692TNwpsoFsmBwDcSeLy5fp+pvLX1si7g@mail.gmail.com>
 <YV7JNH9QvI4cBz5s@kuha.fi.intel.com> <Ya6PTGN4zaZ8RD9K@ripper>
 <Ya9S3cFo0rOUotqY@kuha.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Ya9S3cFo0rOUotqY@kuha.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Prashant Malani <pmalani@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vara Reddy <varar@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On 12/7/21 13:26, Heikki Krogerus wrote:
> +Hans and Imre
> 
> On Mon, Dec 06, 2021 at 02:31:40PM -0800, Bjorn Andersson wrote:
>> On Thu 07 Oct 03:17 PDT 2021, Heikki Krogerus wrote:
>>> On Wed, Oct 06, 2021 at 01:26:35PM -0700, Prashant Malani wrote:
>>>> (CC+ Heikki)
>> [..]
>>>> On Wed, Oct 6, 2021 at 8:19 AM Doug Anderson <dianders@chromium.org> wrote:
>> [..]
>>>         void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode);
>>>
>>> If your USB Type-C controller/port driver does not yet register the DP
>>> alt mode, the it's responsible of handling HPD separately by calling
>>> drm_connector_oob_hotplug_event() on its own.
>>>
>>
>> Finally found my way back to this topic and it doesn't look like I can
>> reuse the existing altmode code with the firmware interface provided by
>> Qualcomm, so  I just hacked something up that invokes
>> drm_connector_oob_hotplug_event().
>>
>> But I'm not able to make sense of what the expected usage is. Reading
>> altmode/displayport.c, it seems that I should only invoke
>> drm_connector_oob_hotplug_event() as HPD state toggles.
>>
>> I made a trial implementation of this, where my firmware interface
>> driver calls drm_connector_oob_hotplug_event() every time HPD state
>> changes and then in my oob_hotplug_event callback I flip the DP
>> controller between on and off.
>>
>> Unfortunately when I then connect my HDMI dongle, I get HPD state HIGH,
>> call the oob_hotplug_event, the DP driver powers up and concludes that
>> there's nothing connected to the dongle and goes to idle. I then connect
>> the HDMI cable to the dongle, the firmware sends me another message with
>> HPD irq and state HIGH, which I ignore because it's not a change in
>> state.
>>
>> In the end I hacked up drm_connector_oob_hotplug_event() to allow me to
>> pass the HPD state and this solves my problem. I can now distinguish
>> between connect, disconnect and attention.
>>
>> Can you please help shed some light on what I might be missing?

The plan always was to pass some extra information, like the number
of available DP lanes (which can make training faster) along as
parameter to the drm_connector_oob_hotplug_event().

The merged version ended up not doing this because there were no
consumers, but passing additional info like HPD state definitely
is ok.

Regards,

Hans


i

