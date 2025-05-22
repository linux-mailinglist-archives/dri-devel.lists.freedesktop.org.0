Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF005AC0160
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 02:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E149C10E75A;
	Thu, 22 May 2025 00:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i513gvp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3562410E75A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 00:26:23 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-30e7bfef27dso4950680a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 17:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1747873581; x=1748478381;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnnxNDzGLL4EAgaeooXIkTZkz8tsZCrpLmChoMSiaWo=;
 b=i513gvp/QowUilBaEdd8AsD6zcDbPGdJ75NM3+mJPADsO2GBoldLkEE3gZX8oTCW0p
 DyOHfnSSfLS7J5nVgMcg9hN7zdXKcZ6qI9By3tyXrY8UqjuULS6J+AMpI9szgmXqRnmg
 HnIfeuiGn9ePc5vSF/+dUUirm+zMl0U5K48yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747873581; x=1748478381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnnxNDzGLL4EAgaeooXIkTZkz8tsZCrpLmChoMSiaWo=;
 b=OK0jeqopm98ZV4rBsKVrZgJ2Q8bj5hUjPPzAsCSwjDFuL1MIWaDj98klHcFURRp6Ms
 1HmoOm7e1vVsG/edNUjYInw7REH5c29hetzAnz6V+wvEj1kAR5Hgg3Qfke+egCFHF4qq
 7TVZGPlRedehKl4Ult5s2T2ieuo4rHwxqeAFtImQ0SAPjthQRdf13NlB8/N+T8Si0Znr
 PTfnwC3JfifEISH0qvd7/j64sCT3Ll/EFK7mQnDjkvlG1KOSxTfp708/H/joj6HkubEz
 EfiM5jzZuQ4V8H3yyklmb8XKg9RkpuolPH09OmkJoRfvdSWotiImW/0k1fXu8UyFWDGs
 ZJVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUojX8eYAPaIWDbie/FJMSchf5ORrL0CkzDf346qDp50iES6cwg0yB74tgx1JOVYLoWpetFoUcBP5o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf8NvMxeQ1CyN6R6fJ/oFOb3bvKTeL7eIgflScSyGJ/0VmFBP0
 4i6ktRJUtCivkpqCm31u9UuUcFARDyQx5/FEWOsxVbPCRLYFu/VTTXdJffqB2CRJqirGxJg49AX
 XY1w=
X-Gm-Gg: ASbGncvARZMUnz0eTzgK0+c95DUeqs2ftbELay5dOnVGREMtQP+9b9W8sH8voOeVtIv
 L1CAKnLTiOaQ2l6jIRz79pdGhW5xyChLwefbTd2Y+FU3SHw6HBbSCPx2BGw09atdWNYCzb43DqZ
 n6H9vrrppsEd29MLJ72lq2+2oeWAgF4Rr6Ii0neT2w5sanXfAvAgUrTVEfh4oIPJd9602nNJLrj
 ICWWNKpBs0VwFEij/8xjHnGs787oWn183VkFTsaeGX29ZO7npHEiPVuG5OpXDfuJjGqIZAbqrhC
 A5T7Bdae8AtMbudHn2CgLkZ7cLi+pnyL5y9kMt2nb2Ya6lZBScjmIpAxxI+V4tJXsdvGCgmF8dv
 0BRQYZZWdQUyR4+FB/JcFQZqO1Zqr0A==
X-Google-Smtp-Source: AGHT+IHJ8W2fYwApv3crGvCImuvr4ARL61zPiAw1+l5AlBN4CHkgvgZ2R0Eq73JQoSDuVAn91Pvetg==
X-Received: by 2002:a17:90b:55cc:b0:30e:4bb3:2533 with SMTP id
 98e67ed59e1d1-30e830ebd4cmr38017495a91.10.1747873581156; 
 Wed, 21 May 2025 17:26:21 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com.
 [209.85.214.171]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f365b22a9sm4284278a91.6.2025.05.21.17.26.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 17:26:19 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-231ecd4f2a5so48059465ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 17:26:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV38VT2WiJAoKS/mKfsD9HrLcBZqU8u9jJbemsBogmzAsk/V+RqjiQvRgqUD/WydCc+NwWv4Unywwk=@lists.freedesktop.org
X-Received: by 2002:a17:902:f551:b0:227:eb61:34b8 with SMTP id
 d9443c01a7336-231de31b3e6mr330148535ad.25.1747873578766; Wed, 21 May 2025
 17:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250521093743.1057466-1-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250521093743.1057466-1-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 May 2025 17:26:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ue1Ls5uHa=G1DyHR8=CotX6uBv0F+i3G+Q_xpmjvntrw@mail.gmail.com>
X-Gm-Features: AX0GCFvCX0RHV3nzaytu3yvrAd4FCZixts9UYZ5fQgUj79qJmywvYBLYC03hDjA
Message-ID: <CAD=FV=Ue1Ls5uHa=G1DyHR8=CotX6uBv0F+i3G+Q_xpmjvntrw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add KDC KD116N3730A05
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
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

Hi,

On Wed, May 21, 2025 at 2:37=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> Add support for the KDC KD116N3730A05, pleace the EDID here for
> subsequent reference.
>
> 00 ff ff ff ff ff ff 00 2c 83 20 12 00 00 00 00
> 30 22 01 04 95 1a 0e 78 03 3a 75 9b 5d 5b 96 28
> 19 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fe
> 00 4b 44 31 31 36 4e 33 37 33 30 41 30 35 00 e2
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add KDC KD116N3730A05
      commit: a3436f63aa4f93b043a970cc72a196a501191ecc
