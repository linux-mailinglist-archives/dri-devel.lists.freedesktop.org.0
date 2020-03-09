Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CCB17EAB4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 22:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE196E49D;
	Mon,  9 Mar 2020 21:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1C86E49D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 21:04:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a25so9236855wrd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 14:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FsRBSfdE1T1XkabqS4jssoseR6/tPbgLzifbVihUd4s=;
 b=ZgX6EII84RmyCkN3dglDEucICaphO9XwhwVQuaP7HVZeOZ6YWrwgBw2JEHwiGvWd5z
 FM5vYp/5CUgsPWT6WxNu3M50+zkQbVsAjzcHFluVqTfvUhp70MYcvBCuJwyrLMrKKIV/
 RGCbVN14H/1SvI4Z7tQZtW0RKGmKeakHF24G+qskLBlB5GspV/3MZy/DA2IMr/LqWl4u
 6i6AzNhbQlqokPdO4PNvDLWxLLkKLgrfmF6pWthMdvMfEnRweqA1UPy9hNSKHYTDcow6
 jWb7LiVeR+I+g3JxvDWtcBxSAB3uHBLZeThXRU02TatRdzf6H+iiZJZi44FK5d+/qdpM
 ypaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FsRBSfdE1T1XkabqS4jssoseR6/tPbgLzifbVihUd4s=;
 b=WKa4jsdC+tfiYX3KKPpx4M+Xkru89Kd0cvMd5jKBmoJImJWQiZc8VXW5XeHBgi6zzh
 t5LJu788fIUqL9gRhpraQ66AYqJv/KxSP691yQhUBYxUJGqTQ9M3qQSKBandyrjVTj3Z
 oT+rU9f9/9sfckkr6eqm+wPBhhShWBC5Deu4ETrGPJEgjUSB56tycmi5eR8eEuhUAiO9
 eDHx8I3p/g2ZErzrDik5SDgj6BB9OfTD7+UMgU/334aERsrT/7FK7DVq0eMKrqrP435U
 ys8H9W515vYK5y8BLU0/Mslyo/u2TKV7GRbATMXI3yv/VAe8T+TAtjEYQ+8aAjsOCCUq
 s25g==
X-Gm-Message-State: ANhLgQ1SyFoKgPBYRWuo9dv5KOMFXo5hHjKorQD1a5SsQJHugA+6V52M
 2+s8bJ31yIbsSKJEa34awFusKIIoH//z3Z0Aq7s=
X-Google-Smtp-Source: ADFU+vvaVP3DmMgzVl/RSGMO9/7IVNUa3ayUwouhdphjHeiOOcBXoS6Zqjaw5cOAztoAagck3sdi/WeIAMOjZA+JoCY=
X-Received: by 2002:a5d:6688:: with SMTP id l8mr22417777wru.362.1583787858603; 
 Mon, 09 Mar 2020 14:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200306234923.547873-1-lyude@redhat.com>
In-Reply-To: <20200306234923.547873-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Mar 2020 17:04:07 -0400
Message-ID: <CADnq5_P_qA8eKoGxeLiGBQXyBT3eL61ghLt3F6ee0eRpbJzOeA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/dp_mst: Fix link address probing regressions
To: Lyude Paul <lyude@redhat.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>, David Francis <david.francis@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 6, 2020 at 6:49 PM Lyude Paul <lyude@redhat.com> wrote:
>
> While fixing some regressions caused by introducing bandwidth checking
> into the DP MST atomic helpers, I realized there was another much more
> subtle regression that got introduced by a seemingly harmless patch to
> fix unused variable errors while compiling with W=1 (mentioned in patch
> 2). Basically, this regression makes it so sometimes link address
> appears to "hang". This patch series fixes it.

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Lyude Paul (2):
>   drm/dp_mst: Make drm_dp_mst_dpcd_write() consistent with
>     drm_dp_dpcd_write()
>   drm/dp_mst: Fix drm_dp_check_mstb_guid() return code
>
>  drivers/gpu/drm/drm_dp_mst_topology.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> --
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
