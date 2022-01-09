Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776B4889F0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 15:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D3488CBF;
	Sun,  9 Jan 2022 14:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A47110E281;
 Sun,  9 Jan 2022 14:54:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id u25so43374105edf.1;
 Sun, 09 Jan 2022 06:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=coLz9xd+0dZhkayM7ELgbsAyvJ6HGW23G1ay1k1gans=;
 b=dxIBTSTJ4L7k/5IjxfD5yHhWulbmoUf8KeEOv7EfMbz8RqvvHb+vBkEqSW/+Jy4b/0
 0N52X8opTTILbLajvaFbCWpySV6AMqJx6V/+iqnY5Dq1CBrZCAtJLo2MQ28K6jEvPCrz
 /You0NG+tw0Agb632fbx/PXaCuJ78H9kK9derewxed2Q0g+NwMLJgE0Xsg+8QXRlo13Q
 DR2T6LqsLO9XY643VBoquTgH6f0SkT4DlAqP6mpzPjOstBaUrEW7mxJhW+0nrwy2BE+R
 BTudFKg+tvA5WmzZ48jdJuHTMK6TeobmuJ6uicVgyVP1YYTX1e1fMvnc/9HTMD6RQcqD
 Lpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coLz9xd+0dZhkayM7ELgbsAyvJ6HGW23G1ay1k1gans=;
 b=JBzxl2H1qP8QFX3Wjqb/MP7x1CHo+Qmum65tYZ/OsWyQpoyp3mfzBbG1gMQqUbd7ZF
 sx4JKwDMWL8VM3RbJS7a4Iz7BSDHe+SmvATQ7GabUqp1oK2eByecgEFdOAPLqJCdPYI4
 tn0zvTbm+vVJlY+r6h3zkqjSXXaMs/ppV4+HDBN7HdhuhBYNYDvo/Ve0QECjCmCuUPFe
 of5dflr63LVdDykSG4+2NIfoBx/67bC5k1J8x3JWC/dtKi5ksb7GEzivNYpnutg3a36C
 XWUgllPGZWxUQbQNfGFRZF3kyrgoJLm4LYV5auqZdhEHkSfSFNa+O4h3xA6DsYBJxmBB
 05kQ==
X-Gm-Message-State: AOAM533U+HAITCP/jHpe1zswN2zxcvxy4h6g0tiGMIycSCprLwH34PwB
 JND9g6LenJGAmiyK6FJmcRJU5+Rp+dPqloH6VzZ5Zelo1lg=
X-Google-Smtp-Source: ABdhPJx0kfmYVwZVXZqnnGiGojZikcq0EwjhLvap3L+7Cyn7Xr6GSIEKIaO+fQ0mVNalU+6XjOSYyli0rw+wz2sNk6Q=
X-Received: by 2002:a17:907:6ea2:: with SMTP id
 sh34mr57897451ejc.509.1641740071118; 
 Sun, 09 Jan 2022 06:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20220106181021.3760251-1-l.stach@pengutronix.de>
In-Reply-To: <20220106181021.3760251-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sun, 9 Jan 2022 15:54:19 +0100
Message-ID: <CAH9NwWfW4Cuqm06w52PKKsSNYtL6Fg-9-PhdBVTNuu1HPtnFyw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: relax submit size limits
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Do., 6. Jan. 2022 um 19:10 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> While all userspace tried to limit commandstreams to 64K in size,
> a bug in the Mesa driver lead to command streams of up to 128K
> being submitted. Allow those to avoid breaking existing userspace.
>
> Fixes: 6dfa2fab8ddd ("drm/etnaviv: limit submit sizes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
