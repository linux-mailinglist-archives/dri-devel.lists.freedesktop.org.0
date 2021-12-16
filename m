Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07CA4779FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 18:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F9510EBB3;
	Thu, 16 Dec 2021 17:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B600910EBB3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:05:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j9so13275319wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7j+m2ZYPkntiUXroa7zFzzHZBrLkwbsxuUr+oxsqFNI=;
 b=L1dfsXv5k7AHZy+h4d/wKJGgSp6OOzSEMHbGjfzefgT4pE3pKnPm2Ka3UwpRmwSzDM
 LxXoZznVyvPD/S+vx8NvL2E1nSaCnSFVgD5S4udQjG5ln000pa4HYuUub+o9gk4WhX1Z
 qQZCboc9fQ0+lfLeZYvvhWVU7kv59K05MOwpQuwbJYOtEf6FkoMB5HT2OwvMRuoGiGBU
 lLJGf3Hd5mkfUroAAKVIfY+aYGUwTet6bGXz2O3aZMNVkmP0P74pOR7K4/d7RaF4c90f
 Y3hpjzCu2Es4f8208X8iDmwvuyw9SjWIl96nyhiJpWAAdtnOT8l1OL9aGYk75iS5lPnJ
 yiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7j+m2ZYPkntiUXroa7zFzzHZBrLkwbsxuUr+oxsqFNI=;
 b=CbDOo7IAiT76x5Nd5Mlog5tvAPhXpgeJhl7PLeWqiwlM+XGyuOpwsR4ec3aMz3tgpt
 WKEnrQyPyH3utzU7Lb5Vhtrnux1vuTOdH78MBdCfJaxTcqPgzdF3/mdq3upAW/08o++s
 DZBRez7+D1vQJ7wuCPDm+ggiteKN/sGQbkprjfEEyF/J4LSXydY4UUiU0yMSRqfv+Qh7
 UkVeAoWOnUydCrG+0JuqeZHBkjUjVXiMUADcW/O1499GTTt0yibpQkAeEuIUGU+71lU3
 N4PVRNMUhzoGllaW52tlyuiN/1QVcKZnTOXOB7OEMEovaMfChm7aQbgAgJaqpUnyqAP5
 np9Q==
X-Gm-Message-State: AOAM532VPwJ8zcJs14oWgsob9UB5ZDLs0v9HvGI1xXn/0FIUIWyNWCmo
 Qlc2ssYoxEhHvHbTSYTWc2s=
X-Google-Smtp-Source: ABdhPJyZ8UBMUzr9lqUalxHqe/IZppy8n/amNPaUkBZXf5QsE1DF0oP6gIvv/f0zaMjDHE8IYYf9Rg==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr2198893wru.57.1639674336115; 
 Thu, 16 Dec 2021 09:05:36 -0800 (PST)
Received: from elementary ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g13sm6222488wri.102.2021.12.16.09.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 09:05:35 -0800 (PST)
Date: Thu, 16 Dec 2021 18:05:32 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: set plane modifiers
Message-ID: <20211216170532.GA16349@elementary>
References: <20211215164213.9760-1-jose.exposito89@gmail.com>
 <3jzxPysjC6vyPfQXQoY5tuHmyXNupFZCZ3babQzWfWRMnI8epycdbhcSF12HWKrjojVo97MlLrJE2HGtM7jcliGZXGXUJSkNcAFn5eTZSu4=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3jzxPysjC6vyPfQXQoY5tuHmyXNupFZCZ3babQzWfWRMnI8epycdbhcSF12HWKrjojVo97MlLrJE2HGtM7jcliGZXGXUJSkNcAFn5eTZSu4=@emersion.fr>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, cphealy@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 05:23:10PM +0000, Simon Ser wrote:
> You'll need to set the format_mod_supported hook as well, otherwise the kernel
> will expose a bogus IN_FORMATS prop with one modifier and zero formats.

Hi Simon,

Thank you very much for reviewing this patch, I just started learning
about DRM and this kind of reviews are really helpful :)

I was a bit confused by the docs[1]: (*stars* added in the relevant parts)

> format_mod_supported:
>
> This *optional* hook is used for the DRM to determine if the given
> format/modifier combination is valid for the plane. This allows the
> DRM to generate the correct format bitmask (which formats apply to
> which modifier), and to valdiate modifiers at atomic_check time.
>
> *If not present*, then any modifier in the plane’s modifier list is
> allowed with any of the plane’s formats.

How I read it: "format_mod_supported" can be ignored where no filtering
is intended.

Looking at "create_in_format_blob" this does not look like a bug... But
I am not sure. You probably know the answer.
Whether the anwser is to chage the docs or "create_in_format_blob" I can
send a patch.

For what is worth, after extrating the relevant bits from Weston's
"drm_plane_populate_formats" function to my test program [2], formats
are not listed if "format_mod_supported" is not implemented. The same
applies to drm_info.
So, for the moment I emailed v2 implementing "format_mod_supported" [3].

By the way, this could be related to [4], see commit
b36a6bb8a151c056e1046e9d5b1192d90d9941c9. If we decided that the docs
are wrong I can send a patch as well.

Thanks again for your input,
Jose

[1] https://www.kernel.org/doc/html/latest/gpu/drm-kms.html?highlight=in_formats#c.drm_plane_funcs
[2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c
[3] https://lore.kernel.org/dri-devel/20211216170140.15803-1-jose.exposito89@gmail.com/T/
[4] https://lists.freedesktop.org/archives/wayland-devel/2021-December/042072.html
