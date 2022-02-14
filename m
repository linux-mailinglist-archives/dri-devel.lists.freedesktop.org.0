Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53E24B4D98
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 12:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F41610E217;
	Mon, 14 Feb 2022 11:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A4610E217
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 11:20:29 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id p7so14423278qvk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 03:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/3VJqYXXpe1iJi/i8ASzJaw2SIFYdT1vlRear1f204U=;
 b=IwfVVrUmiIYOqklXK/spMJxD24X4WrjkPFVDrUMN72NovN9LogZwQ/FolZInWsEpJP
 oMAt9Y7dY1qDeuLIdESZ1b0kh9kcRzgT+r8fBoPqAai6pzg0RdQlCkqP/7VRwOuF7IGs
 p0U9kisNO0FLdF4CI+43G2DQqiiG9FBZyiWtitHe76EHnAVB9Or8gUMNIcRZIF9x4tUS
 DBNx/Xw8nFRzXPfrThBGV4DC9daEoEG6G1xur4oLlcGJM5uRp5wUBjKgkjhZQAnsb4Ns
 v2j5PTLxIXE89+v86rX9NVeItUhDyIms6q5s1at4SZmIjW3EsYIU7P69KfVSmACplyCj
 yP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/3VJqYXXpe1iJi/i8ASzJaw2SIFYdT1vlRear1f204U=;
 b=1iHF3YCL3YURlq6lOlX8hhs4iJX1jokzUrcvcVwndQaSgSpwbnjzBLad47e5MPdlwA
 cc3Pp1qxOM9LbXa1IICaLune7bb/95S/oxRQLoctqyhvmmJvtMDZzPDEcvLQWFe5a7Lp
 w8E64/XtA+Yjn3L8XeUkuKycT9CVY9UHheDtWNl2qZwItIgb8QP2bddt+B/ohodcPQAT
 LJb5jVLpAebK7uEQQj8DyaSRRzFM4QQ1UDXwXJVPLXhtj0WC+T4V/TKfVtJu3XgJdoWn
 jRcpRfqJoHgHlMApxVHDc/XVaeDyAZWa0pjhvVXGK4Kw/IYrl4YOWAqzPD0SffMH3gML
 29fg==
X-Gm-Message-State: AOAM5302v9v1SdYgd4AC7Nwzgf2YBs4GJMO/5dJEOj7JyqNJJ8MdtAVg
 0+5xGvNblukbWWa0Q+Y6jTLDNtybEcfQ4HerK1I=
X-Google-Smtp-Source: ABdhPJz9KEsi8kKzHBJK4prH1EARE/Xv50m3zwfQBN5vVNB1MUpjXnyQivOhhn4Q2sCcinHR6YPZSN2NDzl7XTfbI8Y=
X-Received: by 2002:a05:6214:2344:: with SMTP id
 hu4mr8824629qvb.0.1644837629171; 
 Mon, 14 Feb 2022 03:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214093439.2989-1-christian.koenig@amd.com>
 <20220214093439.2989-8-christian.koenig@amd.com>
In-Reply-To: <20220214093439.2989-8-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 11:20:02 +0000
Message-ID: <CAM0jSHPkvi2DZ2WQrd19DPr5fxGMBKXo6D+FwGEtu+eYMQ0R-Q@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/amdgpu: remove VRAM accounting v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 felix.kuehling@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 09:34, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> This is provided by TTM now.
>
> Also switch man->size to bytes instead of pages and fix the double
> printing of size and usage in debugfs.
>
> v2: fix size checking as well
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
