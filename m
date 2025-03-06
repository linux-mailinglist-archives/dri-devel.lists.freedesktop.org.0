Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDE5A5467A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDBC10E8AD;
	Thu,  6 Mar 2025 09:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BcS47UoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A8A10E8AD
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 09:37:58 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3f67508fc3fso134662b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 01:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741253877; x=1741858677; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ly4DUe1eU6957OuFSZ3eXS3BEy7ZnbSJGPgZO9Zt0qk=;
 b=BcS47UoR9Z93Y3m3CJ5L9xkxS6wyuTESsd2BttfTX3qzCdAE58f3ybJ9eYDDHFYzmX
 tQMnn/O8woOi4aDvZ5+Y1WoWhLFyl9zKaKG+tUN0TXrKK90OpsguGINJ1fkvoGdU7yL/
 Un36SmfJyy8ZD5Tjcrn4imn0XoMVAm//OuqD171UZcxYdLPl+eWVAfJbUSevoLW+zy00
 WtSAxRro8+LsnJQr5lXTu0CqTMXVXV8KA5m5eg56UILtBzOGyG7Alp5rcyeTjA37X+ra
 nuEa7Lrn6qGBz9RFZ5oE371qfdQgfu6ogFeGkV+hf7MslHJ9EIJF2nByiasYLvI1Hf1J
 HlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741253877; x=1741858677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ly4DUe1eU6957OuFSZ3eXS3BEy7ZnbSJGPgZO9Zt0qk=;
 b=kmykBVHopsrRZ8etc1CUCcOfX2IHjkwYc/aWu5OV2/3/ncBvtNoz5xRB7pF6J+T7g5
 1ORxRN0t8yUisiVPPlYWw8wLK1DRQqs2A7EI61vDQxwLgAa2o0p34+2f6CArEXgy3hZe
 CAPYCrw97L2lBljgts5fSsD9ZfiTO7E+2/9J15vtWShh9vjbAThFHKxBa/B4StDaz4A6
 Yd1lyaRaSpZgFa1cXu6dIs7nS+63RAig5vqZakCfaxXy30nHNTxUF2BsA0fjjkfOQxFW
 wa029dnuzGv3RXyiMDTdKRsbJhlWpl/6vUtfqbPeCHDIj3RnzG/2vhCqUYCCwpwhafFi
 n88A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3+88igngSn3osbqRt7q9VcTr8B3Hb4rBv1cfkYfimd4G4kT7umoIlD189leEbb+pqi+qagZlVGbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM09s8OYPb4WKVt56wdeKsqKXwZBOPKsbmA5nqNZ7q9tmnLkmJ
 zcyTolcPFWqbjmNAkjfA2ucWP1yDsR+xLdPeIOfMShc0/EVyt49X8hfKz97wZsaEhkwDlPf/5vF
 yuYhtNcTswH31YTrLcPj1B/T1aw0=
X-Gm-Gg: ASbGnct2A8Dkq5f/uR3H0ef/4r9Q1mwO/yp0swrNiyT2h874BZcnSdL7IwYtE/vzJ8S
 mS/rznKBjzXmulLl4xgnhZbQEn/HFr6/MeimFyq+QlqZ+FGpSD/g/EbXGqj6L3i1VDV62GBqAxQ
 RBqRcbY2sYucEP+HIyVx4DCXj/
X-Google-Smtp-Source: AGHT+IH2qoeCbMEwg0LuMk0rNhe0HnPjQOgBA6M22Fis4lXVJxP3n/tAQ7eCBTbfgxGvZE85sTDxaOzL4aO6krM9OGw=
X-Received: by 2002:a05:6808:2384:b0:3f6:7d8f:63e1 with SMTP id
 5614622812f47-3f683214aadmr3140491b6e.25.1741253877301; Thu, 06 Mar 2025
 01:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20250305084911.6394-1-hanchunchao@inspur.com>
In-Reply-To: <20250305084911.6394-1-hanchunchao@inspur.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 6 Mar 2025 10:37:45 +0100
X-Gm-Features: AQ5f1Jq-LTLZ0dJ8bro4RfPbulbLn2H-ocB-6Y4LD68OracOtht3dbXXHPUJvAE
Message-ID: <CAMeQTsaQQoVQB8WBdQngeOFU=qXF-ajn_0SAOQJhuzk7EL3K6w@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: fix inconsistent indenting warning
To: Charles Han <hanchunchao@inspur.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 5, 2025 at 9:49=E2=80=AFAM Charles Han <hanchunchao@inspur.com>=
 wrote:
>
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/gma500/cdv_device.c:218 cdv_errata() warn: inconsistent i=
ndenting
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Thanks for the patch.
Applied to drm-misc-next

-Patrik

> ---
>  drivers/gpu/drm/gma500/cdv_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500=
/cdv_device.c
> index 3e83299113e3..718d45891fc7 100644
> --- a/drivers/gpu/drm/gma500/cdv_device.c
> +++ b/drivers/gpu/drm/gma500/cdv_device.c
> @@ -215,7 +215,7 @@ static void cdv_errata(struct drm_device *dev)
>          *      Bonus Launch to work around the issue, by degrading
>          *      performance.
>          */
> -        CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
> +       CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
>  }
>
>  /**
> --
> 2.43.0
>
