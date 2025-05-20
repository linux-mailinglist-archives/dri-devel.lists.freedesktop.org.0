Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A35ABDDA9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7624810E4F8;
	Tue, 20 May 2025 14:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m4biKI6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229D110E4F8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 14:47:02 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b26ee6be1ecso3023982a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747752418; x=1748357218;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4vJaDxoDG9WGh9CletqNGUQTpz+mcDhT/atRFz9AQ4=;
 b=m4biKI6jCvP7s1OGosvArHKxyZXlBm76Ntu1x60/FyUN1rsZhshN/UON+A4B0fo2N4
 DOwsutibbc4lDRkiYj8iWPdXVw21tjoAss4c6NfQu655u7EKll2/xx46CBkyIIdMCBrB
 HhD59IMiLf6HNCgNUVdV87CvYQh+qCyQ4VcJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747752418; x=1748357218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G4vJaDxoDG9WGh9CletqNGUQTpz+mcDhT/atRFz9AQ4=;
 b=hA7k49451gEPxCT9tatisGj6hyswUhJAl4HCPjrPdJpZIi4wVqRWrqCxm0fLoHk7c8
 jCp485QJF/96jZh31/R9ZP2zLCQXxGuEDckeqqH/zStfDSBH4XA4V7C5vbPE5fJlBOv6
 mwHEciwvjZly4Uz7lUK+JAJJNCIM3bwt8Tah8pbkMrzO9LnL+CxKXiD4KGeftnQG/C17
 LWipw8M53AG7boUoMBt784YrBxMqShf0byzROhabNJuHeFSNfoOv2UeuMgzPAJRHlv4q
 Pq46UHnKUJqM3l+qbfFB2BvvnX1YBtE7Qb6/62ba0jxauUfMJmKi63afP4G9/EVGOULy
 /MJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdjIqtd670Vmqyh5iiDr+BzHRHaMPkRqmkVtCbntF2eDlbfgxzXtXqmjBy8IxnHqzSh2zd1/Qb9Pc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUfKdxXYCICFQvGrvsqGAA/33xscEXz3NvOfln0Ciz0ADHhdRJ
 MArY77RttlU0aBId48Wt3UgPeFg4KaywuTSylTHrYJTC6iZ9kZ3m8yzdV1zwqKVnEhvz3AddPcu
 G31k=
X-Gm-Gg: ASbGncuEpwTJp756A4dunY6bgLhMvO6ExO5cHX9uvz/Rkj5rUGEbQR5NWlk7m4up3Rn
 Hve9VVogcgasSOnVvgaK/qUNvY+2q66g7b9JDkb1j4W/EhaprC+qKes2kccSkUg2YRcS9La0f06
 qB8WV9tClisiN8lkm+TdrVHc/OIouADOUt4n73bI6LlXSruH5kBCii/cBmqcut8729bbx7g4GTG
 nqdalHfIRoKLdXcxbC/TkopPizRc6Rh6HeSDvYqvvShiqaSzASHJmmLcs2UPIda4BzzdxqPI1IP
 WobEdccKEwsiHJRlYRajWt5rgM2VOzROMtNSb8WC4JQSyb5oAwTxBqVmlztkhpgJ61KHzYitHIv
 uPBS2TPpzK/uVj3SgErg=
X-Google-Smtp-Source: AGHT+IE/VKYbeXKZx8E38mkA3nxmO4HGcsSGIuw5atGPIt57aBzcIft9Qp6ZJN2CnhJey82Szlesxw==
X-Received: by 2002:a17:903:1988:b0:21b:d2b6:ca7f with SMTP id
 d9443c01a7336-231de3ada46mr218560215ad.32.1747752418430; 
 Tue, 20 May 2025 07:46:58 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eaf70df5sm8067323a12.28.2025.05.20.07.46.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:46:56 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b26ee6be1ecso3023863a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVzfWUx/Gyx2wUQCLM6+azzJQuHUSGAc9sQAHz14j0ZvMgBH8RvSkvB+YjsqJl5RUZJJeHXnepNkyU=@lists.freedesktop.org
X-Received: by 2002:a17:902:ea05:b0:223:f9a4:3fa8 with SMTP id
 d9443c01a7336-231de36a90cmr233267205ad.19.1747752415759; Tue, 20 May 2025
 07:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250520124332.71705-1-ernest.vanhoecke@toradex.com>
In-Reply-To: <20250520124332.71705-1-ernest.vanhoecke@toradex.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 May 2025 07:46:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vwu=Oy_HA3Noj0bLX_GcqHLnrRd6kTRZFe0R7Z8-JD2Q@mail.gmail.com>
X-Gm-Features: AX0GCFviZ27GtZgXi5xqwESNlGLrxUC3PhVAhYxJBxB4B6ZFxbz3vrPQhk_NcqI
Message-ID: <CAD=FV=Vwu=Oy_HA3Noj0bLX_GcqHLnrRd6kTRZFe0R7Z8-JD2Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add support for AUO G156HAN03.0 panel
To: ernestvanhoecke@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
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

Hi,

On Tue, May 20, 2025 at 5:43=E2=80=AFAM <ernestvanhoecke@gmail.com> wrote:
>
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> AUO G156HAN03.0 EDID:
>
> 00 ff ff ff ff ff ff 00 06 af ed 30 00 00 00 00
> 1a 1c 01 04 a5 22 13 78 02 05 b5 94 59 59 92 28
> 1d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 78 37 80 b4 70 38 2e 40 6c 30
> aa 00 58 c1 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 47 31 35 36 48 41 4e 30 33 2e 30 20 0a 00 bb
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add support for AUO G156HAN03.0 panel
      commit: a4b4e3fd536763b3405c70ef97a6e7f9af8a00dc
