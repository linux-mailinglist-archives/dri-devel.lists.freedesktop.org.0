Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B627F0FCF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 11:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54B410E382;
	Mon, 20 Nov 2023 10:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F7C10E382
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 10:06:35 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5c516f92759so44283657b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 02:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700474794; x=1701079594; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DNEecYXDNkISAqeuDHyscyNZH+ll3zAc9H0rsEG8n/A=;
 b=WbtB1vO9sB/0Kp7HBoSPz4+GSmCpOggdZ76uEZCl0kWtUt7ioAo3+NkjwL5knhQOQa
 piXISzOxpDsiJQYJ+tnrO6l4Iq0JkC42yALzpdOaDo2YeDzYqPk7LFW4jsF49IX47YeX
 m7IknyeVK+02V1bbCSeD/8U4B10CyrSAd1e1O8uL8qKilbLt1T7kFVn7UjGYrMZiur7g
 PWIR6xqKNePO8j3ipDIbswYjTrceS+nEYSedx8ME2qMBua2Z7lrfJzy5a2QHg4ZfqE8G
 ffhGz7v5jYHWX/Ri6OO1KHFWn/K1s897wY/5hATv4nvYpAtKTL1JkgNKwH6wGW4iKG1B
 v5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700474794; x=1701079594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DNEecYXDNkISAqeuDHyscyNZH+ll3zAc9H0rsEG8n/A=;
 b=ucCl8MLJt4qL6TPH0H3aCG+aIrmj8TH9zV+aLszpBzcG6mjO8NiAkuyPXVtrc5Vsi3
 WK19oYz6bxtcgzxxS9QtCvwDlWN1FWqBMOf1mq0ryzza/FmQAoC8GTgjaFqSDzpF9YtX
 IMi4QAeQS3eXGpC2GM0uxdgyPVA3lV8zHaYoKj9q+ns1manCYSOUSMDBKDMD0lyPawFj
 KavWKWxhqOUHTV6JsWZZF0QZ/wuMQY0IFKhWiizOSrUP+qcfUc2tn7wLTU3sj4FZXt58
 gwVzrFWGDBXV03kaMxNYqGZuis80s5BJ8IeXwiZjQ8hIF2eNyfOEGeswLaytBH5ayEEu
 09nQ==
X-Gm-Message-State: AOJu0YykkSlLKd/W9hlhQxzo6MEkM5Bds99uWPxjFuuZf7C4iC1qdaR0
 OxddQ1oPcBFYi/0mc8hCpAnMyH3B4A3ysX8nVyj8HA==
X-Google-Smtp-Source: AGHT+IF0XirLyzu/r4rL0oP1ePR55mnYibQFUshEJp5OayiBeY5wdovdVMj6vSvI9qabpBBTQvCn0f9ryoVDfMNt9FY=
X-Received: by 2002:a81:5404:0:b0:5a7:e3f9:a1fb with SMTP id
 i4-20020a815404000000b005a7e3f9a1fbmr8128022ywb.42.1700474794228; Mon, 20 Nov
 2023 02:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <1b59d647-c345-4260-b07b-22abb70ae17a@linux.dev>
 <CAA8EJppY2+ymX0kLY+cuR=SV1Po2J24r=NQecmb3ZhSE9NHG7Q@mail.gmail.com>
 <7b85d057-3d66-435a-a657-dd69067b6bef@linux.dev>
 <b9eacd91-8d6f-4265-931e-bc31cadd54d4@linux.dev>
 <CAA8EJpo1KhzTpaSqjbOuQvNKw4WGaqrtNBtNfdNLn28eZVgwhw@mail.gmail.com>
 <cf27d25a-3e51-4292-af63-37e5bc585d88@linux.dev>
 <CAA8EJprm6FL9_ZOr5uBXNXLBt=scs=FY2o6ZEv5r576iEM5KRw@mail.gmail.com>
 <954e2f85-7ed8-4768-97c4-970315afeec1@linux.dev>
In-Reply-To: <954e2f85-7ed8-4768-97c4-970315afeec1@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Nov 2023 12:06:22 +0200
Message-ID: <CAA8EJprU7+Pwkxb+mHjv52V8Gbgkw--u+xSyEOAM78DN9E+92Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Nov 2023 at 19:36, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/17 17:03, Dmitry Baryshkov wrote:
> > On Fri, 17 Nov 2023 at 06:24, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> >> Hi,
> >>
> >> On 2023/11/16 23:23, Dmitry Baryshkov wrote:
> >>>>>> Then you will need some way (fwnode?) to
> >>>>>> discover the bridge chain. And at the last point you will get into the
> >>>>>> device data and/or properties business.
> >>>>>>
> >>>>> No, leave that chance to a more better programmer and forgive me please,
> >>>>> too difficult, I'm afraid of not able to solve. Thanks a lot for the
> >>>>> trust!
> >>>   From my point of view: no.
> >>
> >> I respect the fact that the community prefer generic mechanisms.
> >> If our approach is not what the community want, can I switch back
> >> to my previous solution? I can reduce the duplication of our
> >> localized it66121 driver to a minimal, rewrite it until it meets
> >> the community's requirement. I know our device looks weird and
> >> our approach is not elegant. But at the very least, we could not
> >> mess the community's design up by localize. Otherwise, I don't know
> >> what is the better approach to solve such a problem.
> >>
> >> Can I switch back or any other ideas?
> > I keep on repeating: create the i2c device from your root device
> > driver, which parses BIOS data.
>
>
> You didn't focus on solve the problem, You are focus on solving me.
> How does the method that parsing BIOS data can be generic and applied
> universally?

Parsing BIOS data is unique to your platform (as well as your BIOS
tables). However using and extending (instead of replacing it just for
your platform) is a generic item.

-- 
With best wishes
Dmitry
