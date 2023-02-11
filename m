Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79766933B9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 21:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349D610E19D;
	Sat, 11 Feb 2023 20:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED510E19D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 20:44:02 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dr8so23387301ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 12:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8zOtPlzHJyHxTzcrkWdaVbHH64HwzLCruk6URO7DX8=;
 b=IxGtg6nk24e1PphBTr7tAA4k7Gzm7NpJH7BPGixZQjYkpp2AIPbZQLy78S6jSBPggW
 VC+Nl4mc5RUv4ZR0zCeJcA27MjbtiKVv8fNbcaLDrwttWssNYdnIUNgrDjOn1l/slN8E
 v5a6FURwBcW5GkOIk4upbVRIZE1hChJfzRyYzg2RYfjWKf9Xc1wMo7UcVcQkvRsk+5Sx
 w5MbTVv/x5HgOZ/e8FuurF2wr+vS9rT//xnagN9L8r0Kc3Y6L/zuTyx6ReG+P3JXbFcQ
 joWC3dIJvjRjlZQ5pHXCVSKaN/AyFUom++QNOhs4UrUvP0Sc7x7beGCS4oHNdDnxL9Kv
 3Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8zOtPlzHJyHxTzcrkWdaVbHH64HwzLCruk6URO7DX8=;
 b=CspujjJPWbam+yEtsEoPR34AzGWSWCPk7PlTncuZHoWNYx9WEWdJeUi14y9OrehYJx
 96iPLH3K80hzY+rG/fAXX3/NedXfIv6knGpbVQtXgFZsdUegAsh+Qa507Ti8VxbL+h3c
 adcvwH/MlFW1IQ0Au/3HddZDvW8Ww3ZnYRQEKp3/Pdc3RUpEpHFe/7iOudKiRgzC9CT3
 VVfqphLdnx1s1EUnDB5jHvftTGAWbRKr0zzfvXRCiJiCFumGhH1HKfDYeNKEtAiWqsvb
 AlOZJD9+QV1mEUOrg5F4YzZJLQmK9rcuxwqina11kf3Bq5wCmcHuotvwIxJlmpXt2OvV
 +Xxw==
X-Gm-Message-State: AO0yUKWHg2S3ezkCJzNiGDqLkkagTkbOW36Ml6OmVcOOKIg7reIFrRKv
 hPbzSqKiPuNrGdXgbpmvYMzsddpADVOujT1fHOBjxBPn
X-Google-Smtp-Source: AK7set8Yu6t24lt4jzLsbMqeVxPWjxq7UB4zuraEzhHwkMfIvWsjOz/rR+qfggrbvg0BVZyEoM5EDMV541EyrpqAESA=
X-Received: by 2002:a17:906:25d3:b0:878:6f5d:cecf with SMTP id
 n19-20020a17090625d300b008786f5dcecfmr2788745ejb.4.1676148241489; Sat, 11 Feb
 2023 12:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
 <Y+DPQjukgC0BELkN@intel.com>
In-Reply-To: <Y+DPQjukgC0BELkN@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:43:50 +0100
Message-ID: <CAFBinCBpbRu9xfCEfZJfT7t3doV=+CX03+h7W+HsoW5T4X0W0w@mail.gmail.com>
Subject: Re: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ville.

On Mon, Feb 6, 2023 at 10:58 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
[...]
> > Change HDMI_VENDOR_INFOFRAME_SIZE to 6 bytes so
> > hdmi_vendor_infoframe_pack_only() can properly check the passed buffer
> > size and avoid an out of bounds write to ptr[8] or ptr[9].
>
> The function should return -ENOSPC if the caller didn't
> provide a big enough buffer.
Indeed, I'm not sure why I didn't notice when I sent the patch.

> Are you saying there are drivers that are passing a bogus size here?
Thankfully not - at least when I checked the last time drivers passed
a 10 byte - or bigger - buffer.
My main concern is the HDMI_INFOFRAME_SIZE macro. It's used in various
drivers like this:
  u8 buffer[HDMI_INFOFRAME_SIZE(AVI)];

One could use HDMI_VENDOR_INFOFRAME_SIZE with this as well:
  u8 buffer[HDMI_INFOFRAME_SIZE(VENDOR)];
But it would only result in an 8 byte wide buffer.
Nobody uses it like this yet.

Do you see any reason why my patch could cause problems?
If not then I want to re-send it with an updated description.


Best regards,
Martin
