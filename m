Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4981C691
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 09:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABCE10E10C;
	Fri, 22 Dec 2023 08:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517E510E71F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 00:45:26 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-67f02843e91so7511536d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 16:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1703205925;
 x=1703810725; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vO72U8OhvgCsTxx/aC8/ALqxbW9fKG0Z3MExzKQqln8=;
 b=xaxFeX9F9bR4DXXiPJal5iKOoKbZ29CLGN1z9/e9MN/M0knkg/j6W3WnGtYPrasfno
 pQgNQZ6VepipddZQK/+Sgb5ZyYKkA3GEIK/749D2ip2AehePD4p3hE6Th+fNDoCYk+hQ
 NYpLwEdVmyuFgVW4h1BPfCyueSSSstdAGsWy1cKy1y7b/CI06vxxgiVa2SyV+1rAWyAG
 Ou35SlHLMRLjp7l7opL6FV7xOjoBhaDiPxREofC36ngDiKkvgJg3V5N9cJJbEShnfTLZ
 3nYb1szL1KhBwQFwb6QOHTArWD53zQ6cWDtYO4TUoEdQC23gzzIcUaU+8g2VIJktyS6m
 CiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703205925; x=1703810725;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vO72U8OhvgCsTxx/aC8/ALqxbW9fKG0Z3MExzKQqln8=;
 b=nJTzTjQjEeN4yG00A+IhR9jOZAHddH8Fu6A41L2sSL/CZdCdlEjnifOc+uSp78tdqd
 pJGEkH1tXC6Vi/yik9El4KDV862CoZqLvlf3413tMqKNUxRGlEH4zl/g2k/fyO2N7BiO
 elrXXXXiNztlhZ+Ii9r4QZHdgY7yb0B9GkCq7a8T2XTISUfdHcH6um+XovabncsZSGMl
 E7F48IwFQmOASi74anu2wYJPavHdcoqv0vxz4sHnyLZbktLfd956V8z2mYMGQeg0wxPu
 QS3EFUrWcl7tiFvzKMOhAVoRZQAZU5fQ+e9JFU5dNwC+YMiqavg7kvKyheV4h6/+O4Qn
 QrYQ==
X-Gm-Message-State: AOJu0YyXxteSwMVIOzsbZ9qSbYVamnvGzXoxvopUXXgRWDuMfu4/pD41
 qzsEOKbyyeFKpRt5Fc5+oLSxsL6L/tOQA4ncaIFp+PLhTcIP
X-Google-Smtp-Source: AGHT+IGlXvi3g0g2VEeP4AL+AxR5RLB0jBCBrh4ZfaNIWy6p/3fXWWJfTWzmA43P7UWukKd7BgYhkilgv+25o8qOUYs=
X-Received: by 2002:a05:6214:27c1:b0:67f:7aa:2b75 with SMTP id
 ge1-20020a05621427c100b0067f07aa2b75mr546603qvb.104.1703205925444; Thu, 21
 Dec 2023 16:45:25 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6200:3989:b0:52b:9b0d:f9a8 with HTTP; Thu, 21 Dec 2023
 16:45:25 -0800 (PST)
X-Originating-IP: [135.23.195.66]
In-Reply-To: <20231222003830.3733310-1-samuel@dionne-riel.com>
References: <20231222003830.3733310-1-samuel@dionne-riel.com>
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
Date: Thu, 21 Dec 2023 19:45:25 -0500
Message-ID: <CAN1fySWi_QJt8ufUc99vRiE17-SfQOGfMsxFqH+TJC1PgjRsDw@mail.gmail.com>
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for GPD Win Mini
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 22 Dec 2023 08:27:45 +0000
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
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Sorry, I was preparing for sending to the mailing list, and sent
before I should have.

I believe I have the orientation on the wrong side, though, so please
wait for a follow-up here or the v2.

Sorry again,

On 12/21/23, Samuel Dionne-Riel <samuel@dionne-riel.com> wrote:
> Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index 3d92f66e550c3..f730886ae10df 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -279,6 +279,12 @@ static const struct dmi_system_id orientation_data[]=
 =3D
> {
>  		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
>  		},
>  		.driver_data =3D (void *)&lcd720x1280_rightside_up,
> +	}, {	/* GPD Win Mini */
> +		.matches =3D {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1617-01")
> +		},
> +		.driver_data =3D (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* I.T.Works TW891 */
>  		.matches =3D {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
> --
> 2.42.0
>
>


--=20
=E2=80=94 Samuel Dionne-Riel
