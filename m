Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174B489B33
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 15:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518E010EA6A;
	Mon, 10 Jan 2022 14:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C73010E97D;
 Mon, 10 Jan 2022 14:22:21 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id v7so11205964qtw.13;
 Mon, 10 Jan 2022 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bhtxXdrNNQLA2wEe4BgKLLDPV6Om3BGGtu6Ntfw+Rq4=;
 b=Y3xtu+3zFCRQ8x31FgrD4xGutAL+HeNk4zYKc5dARlnUrgkcpz5GnCgoP3gnGEa0RC
 mSlUd1k5aWuqs7MO7PlHs2vATVAgkAslidjLUL3fjPDDlm/xDxhf6ID5FfJVSkWHeyqI
 O/nG9vZFo/fH1beSiJi7iPJlyx3i4WQZqSrnzbFRZ0aLSqWHLYpiIK0dQtWKRfE9CcDG
 nbY6HpiMiGO9ddF3G8d7jC+xj3r+uOs2CLPdXc/JXezMc65T46P6vvdYYweuKR9iitCu
 0t0MOOkMhnyM48NJSlUzeCGqOeXUFbiqual9SCRuE8J1weS4PkJZP4el9osoq1EZ7gyE
 WgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bhtxXdrNNQLA2wEe4BgKLLDPV6Om3BGGtu6Ntfw+Rq4=;
 b=TFisKTUdOlpiY8xSorp43jKds1CFMmQGXP3lAPksDnE+quMvD1H4przHsihWWAlzXj
 a2tdEAtvfTC5f7FOWbPQo7k+Ri2hDYRwLTC1VKJvXkMznHAKejLvm0JsWi1OlouJCC5U
 VGLiDsMQKgBpnVe0bJAPgAkXZKktsbjPZHGE7qlcyqLdNzmqEUqIIL/cKZ/QTdKWQ+hK
 PZXMv2fkIBBcqePg61ao8JRnV5AwRb2VfTdhhrWP0MeKbM/S/5LfW9r50zVv4/4C0rhI
 Qx45zkEwbUaThXvDdfdTc2A/jTKFZvJSl6dJLwggKhsSY+W4pjsjBS2SXdHnAutd1/IQ
 8kUw==
X-Gm-Message-State: AOAM5330fnnEQ+kLOzP+u20v0rijnpA3gh8tWSsqRPlg0EIx+4kEUTFf
 k+Tsep3/s3qBA544c+VSH9QDGNjOKJTDNTX9MXvflV3Lwh5x3Q==
X-Google-Smtp-Source: ABdhPJyA1azuSCyAiCf7Je7zRdWuGUt5RNr2jLIkDV8mX5uXiMGi9dNHTUetUDgBRZNAxAykHnp0dMcjtvghqLTL8mQ=
X-Received: by 2002:ac8:7d07:: with SMTP id g7mr65309102qtb.364.1641824540464; 
 Mon, 10 Jan 2022 06:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20220107142343.56811-1-thomas.hellstrom@linux.intel.com>
 <20220107142343.56811-7-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220107142343.56811-7-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 10 Jan 2022 14:21:53 +0000
Message-ID: <CAM0jSHPX83GrMqazs7m6O=+OM0zj_Z35h_PKq1zerc8GuGEQjA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v6 6/6] drm/i915: Use struct vma_resource
 instead of struct vma_snapshot
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Jan 2022 at 14:24, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> There is always a struct vma_resource guaranteed to be alive when we
> access a corresponding struct vma_snapshot.
>
> So ditch the latter and instead of allocating vma_snapshots, reference
> the already existning vma_resource.
>
> This requires a couple of extra members in struct vma_resource but that's
> a small price to pay for the simplification.
>
> v2:
> - Fix a missing include and declaration (kernel test robot <lkp@intel.com=
>)
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
