Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4563372452F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0593410E24B;
	Tue,  6 Jun 2023 14:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBB010E240;
 Tue,  6 Jun 2023 14:02:56 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6b28eefb49cso1061323a34.0; 
 Tue, 06 Jun 2023 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686060175; x=1688652175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKfMxnlTG/tbmuksWuOGZWrrvfs8QjlyYN4r2hnIpWo=;
 b=VA42Clb/LLV7nHqt/y8/XVxTan46RsgI8crf9vhzZRuiychWUTwqv0bsNXuz1rz7xu
 MlGWultN0RTL1m/HaT5y1hLhfLRp+ea9eGpqaJ04pgBw9o1VxDlkbNsj5SGtYpKtnE3R
 u0gs7e3qAIZZy3JfBBWI/huXTusyPeG55EBuAYrFTrVJs0YnBVt8dHEaa5otkZFA+8x4
 MsgphfPGBFX3hxHFZUie4K7a/KcGSIN0xizFUxP+75ax6WzzD/0WJtLpBXhaDJtvVqky
 f6vxhN6ghr+kGS6VBHc13JH9560ANfmpjy0ygTVrMklQVdZIWOEjfOV+N03omHKgc5ZH
 +87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060175; x=1688652175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKfMxnlTG/tbmuksWuOGZWrrvfs8QjlyYN4r2hnIpWo=;
 b=CJcA9tHMTCeMiDtrXt+kp55Y3aNj5jDUrXB89pvIvZt6VwFGbPCE6hrbiOuLptcid+
 Me1xumA8XKF7lGJf0aimF8X90HD/f+11S5H+hgLTppri2UFPttkuR+GT5cawNN996FXU
 0YlfpY6LJIRdt6cEwD+rTIKC03i+LmWi23N+IFFW6oFSdqpWNSn2lLxApC8s6axWj1i3
 e0CSw33++UGTN4QMn9rNoBu9wUVUqWPuK/qjug2zVb0jsP5IzKgjSwAaqM008nufPAR0
 I6UGot07a8QB4paiXk7P5K455DW0P4nuCHfwNKvlxeJu2Yeekeuimry4rzvtXm4w/m0O
 Y8/Q==
X-Gm-Message-State: AC+VfDyFAtsmDEIE/tEytcWxBCkNmXPeUpii2rDounDY/A5L+LDr7pms
 OthZm6QdHXBqUB+jjkuSF/MUNvU2Sk+Gm2WsLqQ=
X-Google-Smtp-Source: ACHHUZ7ElSN1h6Nn2Mycq3M2NnCpSv8PBO/3dsGRn7+ApEUjV4I+bf369hsLA1VMW49PWCrORbuNPG4AeB/CJ+Hvhys=
X-Received: by 2002:a05:6808:98b:b0:398:2b78:5a53 with SMTP id
 a11-20020a056808098b00b003982b785a53mr1067410oic.40.1686060175306; Tue, 06
 Jun 2023 07:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230605183007.204399-1-hamza.mahfooz@amd.com>
 <20230605183007.204399-2-hamza.mahfooz@amd.com>
In-Reply-To: <20230605183007.204399-2-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Jun 2023 10:02:44 -0400
Message-ID: <CADnq5_N72yxvjVNT5jEe496J36L8x9bZKaWHZ1X6=qwMPW8_rw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: mark dml314's UseMinimumDCFCLK() as
 noinline_for_stack
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Leo Li <sunpeng.li@amd.com>,
 Tom Rix <trix@redhat.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 llvm@lists.linux.dev, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Paul Hsieh <Paul.Hsieh@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Mon, Jun 5, 2023 at 2:30=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.com=
> wrote:
>
> clang reports:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.=
c:3892:6: error: stack frame size (2632) exceeds limit (2048) in 'dml314_Mo=
deSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>  3892 | void dml314_ModeSupportAndSystemConfigurationFull(struct display_=
mode_lib *mode_lib)
>       |      ^
> 1 error generated.
>
> So, since UseMinimumDCFCLK() consumes a lot of stack space, mark it as
> noinline_for_stack to prevent it from blowing up
> dml314_ModeSupportAndSystemConfigurationFull()'s stack size.
>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_3=
14.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> index 27b83162ae45..1532a7e0ed6c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> @@ -7061,7 +7061,7 @@ static double CalculateUrgentLatency(
>         return ret;
>  }
>
> -static void UseMinimumDCFCLK(
> +static noinline_for_stack void UseMinimumDCFCLK(
>                 struct display_mode_lib *mode_lib,
>                 int MaxPrefetchMode,
>                 int ReorderingBytes)
> --
> 2.40.1
>
