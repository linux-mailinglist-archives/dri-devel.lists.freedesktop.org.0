Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF94A5331
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 00:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE6010E451;
	Mon, 31 Jan 2022 23:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187B910E452
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643671588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoObquMC1Y099gjHiKrPd1NW4/MPXx5uArpEcPqAfgo=;
 b=SPVXVCFRbu3o/BAfrB9eB/IIHLwWnrBtM8ghgKXoWRx2qWbax/mDf4einrW/uWbzAzZTVD
 BaYC7XtxARL1BCviJFXzaDcm3xAALKODHhKN4P0xkgXhVT9ihtHTUW0YE58qb2/HT0vwo4
 jX7dvSrTmpnLl9fHi/74lJ4HpJsBxZ0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-_fDyQPbsORKwumD5BIoivA-1; Mon, 31 Jan 2022 18:26:24 -0500
X-MC-Unique: _fDyQPbsORKwumD5BIoivA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a1c7207000000b0034ec3d8ce0aso275714wmc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YoObquMC1Y099gjHiKrPd1NW4/MPXx5uArpEcPqAfgo=;
 b=xspUdDRUC0c7HCdd79PM0a1kqTeF/LRGzabvTheECkQP17bY//xbt2pMCXWa0KelK6
 c5DyX4HUBHZayG68XX3rkKMspUkWmZJzhblerOF7R5TgtW4g7StVmx3qjlSa43QZXUcf
 hZURaM3YtmkcQclcvnH03NaZf73ZPX2oeqXHiYMgCTUjtXVORKNhmCtHVaVRjVYhXvX7
 sm6qEFy9wmvomd+2fBhhqrm8oQI2t4QUUlC9sEr+cEnrt4I+u9mzO2xJe020ClALSMiL
 RyDCTnIDahlpiPkdMRL+tXTqTESHHJ3HAlvIFn53LNB2qqhJCaC6Uur6JPDjTAlj1lGy
 n1ZA==
X-Gm-Message-State: AOAM530KJ4oMnjfTB4TlvRIl169+bAgttrJOlrUc15LJEUNQEO0XQ68F
 rLNcg1rErlTE6kdlIgS6qTrdXor4gGrupscTpcoQRzXQ8VqAMT+K9+xM5KLuiZR+JJT0e1VdYUF
 hp8eLYJGNqiF1uve9yZ7W8tZw51zW
X-Received: by 2002:a1c:440a:: with SMTP id r10mr20863798wma.142.1643671583666; 
 Mon, 31 Jan 2022 15:26:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvDyBUYLTU/L1b51CS4uxvaGJqLeLCo2c7D1CjSfutkqldhTLTiY2yHFXAdgxPYSuz6ErDnQ==
X-Received: by 2002:a1c:440a:: with SMTP id r10mr20863790wma.142.1643671583508; 
 Mon, 31 Jan 2022 15:26:23 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id h4sm15500586wre.0.2022.01.31.15.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:26:23 -0800 (PST)
Message-ID: <03ffaaa6-1a8c-68fa-dd17-1e6d0e1e4868@redhat.com>
Date: Tue, 1 Feb 2022 00:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfhMESTylI1NTKDg@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/22 21:52, Sam Ravnborg wrote:
> On Mon, Jan 31, 2022 at 09:12:21PM +0100, Javier Martinez Canillas wrote:
>> There isn't a connector type for display controllers accesed through I2C,
>> most drivers use DRM_MODE_CONNECTOR_Unknown or DRM_MODE_CONNECTOR_VIRTUAL.
>>
>> Add an I2C connector type to match the actual connector.
>>
>> As Noralf Trønnes mentions in commit fc06bf1d76d6 ("drm: Add SPI connector
>> type"), user-space should be able to cope with a connector type that does
>> not yet understand.
>>
>> Tested with `modetest -M ssd1307 -c` and shows the connector as unknown-1.
> I had expected unknown-21??
>

As you pointed out in patch 3/4, I forgot to change DRM_MODE_CONNECTOR_Unknown
to DRM_MODE_CONNECTOR_I2C after adding this patch...
 
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> ---

Thanks!

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

