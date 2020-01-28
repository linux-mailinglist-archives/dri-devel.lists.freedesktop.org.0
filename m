Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12E314C20F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 22:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD9B6F41D;
	Tue, 28 Jan 2020 21:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D676F41D;
 Tue, 28 Jan 2020 21:20:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t2so17772796wrr.1;
 Tue, 28 Jan 2020 13:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zI+cNUNLF3kaXSaB95jriRVjzozM0k40b3VUnBQ2hL4=;
 b=cr1Eugxz1jDRTs5xXm0mdslOFP/LW6r93aHJoQ549mVFWqHrC7WNncFStX/6Q9ce9v
 nz/ilbtGXaVqmwnuUOtPzEEhhnZbi3G+ArTMvX9t3TNlebra7xCRIRaoIySvpHIHToPn
 ZIniEsnYZOL+8NM4M6/QoQ7Yn43VBVyPuanKM45xtbmRasmAHJluexqc8RsEXCiIJ2Y5
 ULKgK92O+HRsoauqf+y8qkpWo0+kSEedvad0oMmKLIq8QKCz2+K4HunTYzUN4LPIveRF
 yFnleba3CQRXqMwll04l9z6s5L9y3Xgoqx8P/n6lFGMEIWPn1inGG3AfqJtGjWK0k+K2
 q6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zI+cNUNLF3kaXSaB95jriRVjzozM0k40b3VUnBQ2hL4=;
 b=ahypR/r/zCUv3/q3oo9MfwB4G8cA/zHB8WVSMFjd7dQQI8qWeY4vOsQE5PFffm5eoj
 PwuKl2jV2emLpGvr0iD4DSUdraNzzNxz2oU+k8122EkomoIhGbCHOPCqU8bDWZ60suPQ
 DlzwiqH0Qw144b6wTXhY2bAS0Jz/aBWj1GP96jMTMxFLJ744ejidpldtAc8kUctgq7Qt
 tajsRtpn1v2kvhT3zbeJE8GCXuYlkrJ24TgZSA7pRTpb6ojyMGmV6jb4TtOmEWhd0n3C
 qi5rAAZKDVFffumcNO/MJAaDi+BRnWgdK2/wgn1IhrixBATLsl71lWA7lKAmRqZKWeqX
 6qjQ==
X-Gm-Message-State: APjAAAVgPTsYgGOp9l1ZgQHqiQC+W/jXSBDYWMZOe0xTuEMBFG07rwde
 N7wwV72P3rOoNw18eGut8zJXvXjWZfkLGYrPcLY=
X-Google-Smtp-Source: APXvYqzxeqjTVGWhGxKoLAamd10Qlofs6anWK7unOqW4V0Q59Aa6fL+sO2cRfdjqYiyhrmbqNf2yQCOAN4GC6qOHll4=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr30178824wrp.111.1580246408308; 
 Tue, 28 Jan 2020 13:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20200128112827.43682-1-colin.king@canonical.com>
In-Reply-To: <20200128112827.43682-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jan 2020 16:19:56 -0500
Message-ID: <CADnq5_O=W6TFFCGZsdvtuLPijanxX4vdkdmedh2OxZauG6M58w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix spelling mistake link_integiry_check
 -> link_integrity_check
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 6:28 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake on the struct field name link_integiry_check,
> fix this by renaming it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h           | 2 +-
>  .../gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c    | 8 ++++----
>  .../gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c   | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> index f98d3d9ecb6d..af78e4f1be68 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
> @@ -63,7 +63,7 @@ struct mod_hdcp_transition_input_hdcp1 {
>         uint8_t hdcp_capable_dp;
>         uint8_t binfo_read_dp;
>         uint8_t r0p_available_dp;
> -       uint8_t link_integiry_check;
> +       uint8_t link_integrity_check;
>         uint8_t reauth_request_check;
>         uint8_t stream_encryption_dp;
>  };
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> index 04845e43df15..37670db64855 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
> @@ -283,8 +283,8 @@ static enum mod_hdcp_status wait_for_ready(struct mod_hdcp *hdcp,
>                                 hdcp, "bstatus_read"))
>                         goto out;
>                 if (!mod_hdcp_execute_and_set(check_link_integrity_dp,
> -                               &input->link_integiry_check, &status,
> -                               hdcp, "link_integiry_check"))
> +                               &input->link_integrity_check, &status,
> +                               hdcp, "link_integrity_check"))
>                         goto out;
>                 if (!mod_hdcp_execute_and_set(check_no_reauthentication_request_dp,
>                                 &input->reauth_request_check, &status,
> @@ -431,8 +431,8 @@ static enum mod_hdcp_status authenticated_dp(struct mod_hdcp *hdcp,
>                         hdcp, "bstatus_read"))
>                 goto out;
>         if (!mod_hdcp_execute_and_set(check_link_integrity_dp,
> -                       &input->link_integiry_check, &status,
> -                       hdcp, "link_integiry_check"))
> +                       &input->link_integrity_check, &status,
> +                       hdcp, "link_integrity_check"))
>                 goto out;
>         if (!mod_hdcp_execute_and_set(check_no_reauthentication_request_dp,
>                         &input->reauth_request_check, &status,
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> index 21ebc62bb9d9..76edcbe51f71 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_transition.c
> @@ -241,7 +241,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_dp_transition(struct mod_hdcp *hdcp,
>                 }
>                 break;
>         case D1_A4_AUTHENTICATED:
> -               if (input->link_integiry_check != PASS ||
> +               if (input->link_integrity_check != PASS ||
>                                 input->reauth_request_check != PASS) {
>                         /* 1A-07: restart hdcp on a link integrity failure */
>                         fail_and_restart_in_ms(0, &status, output);
> @@ -249,7 +249,7 @@ enum mod_hdcp_status mod_hdcp_hdcp1_dp_transition(struct mod_hdcp *hdcp,
>                 }
>                 break;
>         case D1_A6_WAIT_FOR_READY:
> -               if (input->link_integiry_check == FAIL ||
> +               if (input->link_integrity_check == FAIL ||
>                                 input->reauth_request_check == FAIL) {
>                         fail_and_restart_in_ms(0, &status, output);
>                         break;
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
