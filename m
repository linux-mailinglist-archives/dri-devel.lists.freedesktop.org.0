Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E941697786A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 07:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F202A10E01F;
	Fri, 13 Sep 2024 05:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dXwlI62+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDB110E01F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 05:40:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42cbc38a997so10417015e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 22:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726206027; x=1726810827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vqeBueurHg1MlYbxoLo01Cyqnr241lqjsc3UJHOuPFo=;
 b=dXwlI62+kFlpA2fGVC3jGuBbB3OyFVE6vJOCyRGPV2g2yU+URw3HIMSOxvxKsAaNf6
 C/KZ6QSoxF7LMh6VnRO/e/OVBpxgZFKnU2akpBlt40byEVaHM+ISlrtns5aVzsyw+vMN
 DjE7lxm5br6wENL+F7ANAe16EJv25APCbawPYdRBOb7Xzsklzedi+t/V9SCkD/VXxasF
 RBc8qbq1xteJSEhYd9bjLxZjaxWA7hDl8djASk3J+5rJQTusT2b2ieaQ4afrw2CQToWF
 VsehFwSLMzX+7iEaqkBv+WryCwU5+AiIra4bteStrSCzBbu2LwVelxVJgR4aMUD59kw3
 DwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726206027; x=1726810827;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vqeBueurHg1MlYbxoLo01Cyqnr241lqjsc3UJHOuPFo=;
 b=wEz/LPPOqAEqpDCPTc1y8UHNCmJ5A4eDixwmiFOEEfkgfcA4swByKi5WO1G2tYhkYa
 rJMGuD3RA0vFWjkert7/zpWgWguspXLQxT8qK2NHX14quYlk+n9OcrRwN2YUdx+e6F51
 hPKSTdLHquwvXpeR3KrJR1x7XtizB52WmFCLCUpzka4RDMe3OxTmDd4wzAJPN0AtBrg2
 dh4hG0dbAN07c7K//3PpOte75HDYgggr8Yaw4jDo3uw8lc/DpvK8GaSzI5fX12K+jnxm
 DIo86ngjFmvCBE7g0ACd/O8phWyV6vc3DqSu2RNZqBU4xO2Lg4x2Xhm1FBiOMW9VBYNs
 YwDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGahb7PiWL6D4UlrkdsdPrJKb13+LHwl5ipkJ5922zgPov0hsanIoEQ3Zza/eg8n94MVB3gZ51nFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUoDMi+8MVATe66u/7ukdiTsGRMYowHkn1wA4JgBWwPiB82rWh
 K9Ebzr72sQgTjeJahTyUaCWkUto5vZ6oyjuvViAN55dV29EfpJDi
X-Google-Smtp-Source: AGHT+IHFHXJvqh5YE9WoijwYaXi/zKjLEAnVxSOFH8ymQwiPDwQttWOmZq3Eb18i3jLZBDpzLua8Vw==
X-Received: by 2002:a05:600c:450a:b0:424:a7f1:ba2 with SMTP id
 5b1f17b1804b1-42cbde23be4mr74941545e9.17.1726206026206; 
 Thu, 12 Sep 2024 22:40:26 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b182004sm11524655e9.46.2024.09.12.22.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 22:40:25 -0700 (PDT)
Message-ID: <69776448-0328-4880-9108-54466e40ddd9@gmail.com>
Date: Fri, 13 Sep 2024 08:40:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
To: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
 <6c9b7f85-f92d-44ed-ae9d-00f6d55ea614@gmail.com>
 <a2cf4e9b9c3343a7398521760934f1740505aa13.camel@mediatek.com>
 <13f6dbc5d460e746352f68b001e85f870c89993d.camel@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <13f6dbc5d460e746352f68b001e85f870c89993d.camel@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2024-09-13 05:56 +03:00, Jason-JH Lin (林睿祥) wrote:
> Hi Alper,
> 
> I think that's a platform issue because it works find in my MT8188
> platform, but I don't have any MT8173 platform.
> 
> Can you help me test the fix patch in your MT8173 platform?
> I'll provide a fix patch in 2 weeks via Google Chat.
> 
> Regards,
> Jason-JH.Lin

I replied over Google Chat, but to make it clear for others on the
mailing list: Yes, I'll try to test patches when you send them.

> On Fri, 2024-09-13 at 01:25 +0000, CK Hu (胡俊光) wrote:
>> Hi, Jason:
>> 
>> Please help to fix this issue.
>> Otherwise, I would revert this series.
>> 
>> Regards,
>> CK
>> 
>> On Thu, 2024-09-12 at 23:29 +0300, Alper Nebi Yasak wrote:
>> >   
>> > External email : Please do not click links or open attachments
>> > until you have verified the sender or the content.
>> >  Hi,
>> > 
>> > On 2024-07-31 16:34 +03:00, Chun-Kuang Hu wrote:
>> > > Hi, Shawn:
>> > > 
>> > > Hsiao Chien Sung via B4 Relay
>> > > <devnull+shawn.sung.mediatek.com@kernel.org> 於 2024年7月17日 週三
>> > > 下午1:24寫道：
>> > > > 
>> > > > Support "Pre-multiplied" and "None" blend mode on MediaTek's
>> > > > chips by
>> > > > adding correct blend mode property when the planes init.
>> > > > Before this patch, only the "Coverage" mode (default) is
>> > > > supported.
>> > > 
>> > > For the whole series, applied to mediatek-drm-next [1], thanks.
>> > > 
>> > > [1] 
>> > > https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next
>> > 
>> > I am seeing broken colors on an MT8173 Chromebook with next-
>> > 20240912,
>> > which goes away if I git-revert this series (commits 1f66fe62cc09
>> > eb17c5909481 a3f7f7ef4bfe 59e9d9de25f0 4225d5d5e779).
>> > 
>> > To illustrate, I took a picture [1] of some color mixing diagrams
>> > from
>> > Wikipedia [2]. Do you have an idea of what goes wrong?
>> > 
>> > (I'm busy with too many things so I don't want to debug it now...)
>> > 
>> > [1] https://i.imgur.com/tNFvovB.jpeg
>> > [2] https://en.wikipedia.org/wiki/Color_space#Generic
