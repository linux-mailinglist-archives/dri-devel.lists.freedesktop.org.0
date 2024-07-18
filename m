Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856BE934C2D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0139E10E782;
	Thu, 18 Jul 2024 11:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="ORUJe2Xl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC010E782
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:04:53 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-79f1be45ca8so9954685a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 04:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721300692; x=1721905492;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RXIeiQqNiesn+Lz7qzezR5lVa/jr5pI5RgzcqKbMfA8=;
 b=ORUJe2XltNBnE78YJKvviKoLI5ERlDTh8B0Fr7KNaPiuCr3VdvNrgpf3WG0lhbzuD7
 ren3jnJ7jvg+p35kY4oSl9jjIQsUgD8YqZ21e1+rqk8I7qO5Xtub7Y9UDJebZlQnZc5D
 d+u2SSBXr2Ws3TQDVz874TSRDIysN/cIUD4kybPEuE/ZV8VDMw5c6ZVjm4Mcy/KWRcun
 WZ9Bx4loNi27QdzKdV5GbwrJeyIBqtiPUE05U4aqvFZ7psrFOsjmKjNJzMj9caue7+Fu
 gEVPW66IYLxiokL/sWMjp84fV1Vp4XKkqtyoQnPsEJ3PElxs9XTL46z4cPo6xk/USxYx
 kY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721300692; x=1721905492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXIeiQqNiesn+Lz7qzezR5lVa/jr5pI5RgzcqKbMfA8=;
 b=vkrkQx/e5oQlM4kEf8FzomBXm5ynY00alNrbJ/YlkE1Yot5WvIqLTOOuDeBJXYffCb
 DbI1SwY3BYEsWR/UCb5BZf6U2aoMLkRRdmRsMYQpflCIc0eNcxmRjdKBFcZrPUOCb4Mn
 327Hc1Xm9oE7wHIl4UfXDihnNKys9LGB2fLr0k7B4dSMLR8yWa1HJO4f2YuCXpKsJVc4
 lHO6dg+vCxmwpQhSEDrXMMA/iHm8nfZiK5nrj0iZ16v71YSfkk4VOIC/Z55emBMEHnaD
 Rh/zXCBVCXsrCu44sEMAn6rutZJAkG8IS+DWAz+7R0NY+FdhRdWtyH2cPO5bIDYt+sOY
 j0rA==
X-Gm-Message-State: AOJu0YyVTT8t+3g1BAknBchYXGf8D4hPAGKhJPnHcgZK6gkCthC87o/B
 WCuSsUPaa1mBx2eOU2dWZbEiI5tXvH8/Peey/9fbziLTffYLACkpBv+Zbsi+oQCwj4KUH4lBmkw
 00kNlHi9PUrOEgdihC/xJrh+SUcH8kDl6Bkp46Q==
X-Google-Smtp-Source: AGHT+IGgkUA5b55apbL2n7LdyIAxIvHi92rtAz5Q3iyPcwE2GoK3q4zm4Znhn6Rf6ESY+hKwEkRco+JgbSenEBb75NE=
X-Received: by 2002:a05:620a:2483:b0:79e:f730:e2d7 with SMTP id
 af79cd13be357-7a1874fe132mr486555085a.51.1721300691931; Thu, 18 Jul 2024
 04:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240717235221.64629-1-deborah.brouwer@collabora.com>
In-Reply-To: <20240717235221.64629-1-deborah.brouwer@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 18 Jul 2024 12:04:40 +0100
Message-ID: <CAPj87rPdWdCQt9pVvq9EobARJLzxx3Y3o4pFozZ4fWi6qsKKvw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: update link to Gitlab server
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, vignesh.raman@collabora.com, 
 sergi.blanch.torne@collabora.com, guilherme.gallo@collabora.com, 
 robdclark@gmail.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 18 Jul 2024 at 00:52, Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
> Before building an image, the build script looks to see if there are fixes
> to apply from an upstream repository. The link for the upstream repository
> git://anongit.freedesktop.org/drm/drm became obsolete with the move to
> Gitlab server in March 2024. Until recently, this obsolete link was
> harmless because anongit would at least respond that there were no such
> fixes available. In the last few days anongit has stopped responding to
> requests causing the build script to hang indefinitely.
>
> Update the link from anongit to the Gitlab server to prevent the build
> script from hanging indefinitely.

It should be fixed by now, but yeah, the canonical source has changed.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Thanks Deborah!

Cheers,
Daniel
