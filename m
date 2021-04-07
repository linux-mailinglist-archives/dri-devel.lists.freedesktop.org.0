Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855B356C55
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 14:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697E76E0EF;
	Wed,  7 Apr 2021 12:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C73B6E0D1;
 Wed,  7 Apr 2021 12:40:30 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a1so20509728ljp.2;
 Wed, 07 Apr 2021 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Rd7e/jtpUxeuvKLkUMh6oQaE/fxz3yxbf4FPN9GQVu0=;
 b=BeD/ep2sjkHkAv7TXhX0cjv6dz3gLjd9VnK0S/V2CPMGl5sV9puUK4Ep8Gpw8sTCEU
 /ARRpCdbedfeRLoGv/QdaJHh+6PrRDsb/4iW0ntgidN4KGjwxukPublL8/2Yl53EBgZi
 qe6wya/Rm9Cijs+jmuEUnC2TXbwMfr+UjJr+/NBqEBr5vzKPRqdGc8hOt4SYurSKwwgx
 89bLjoEMwVBa9rxbH41odx7Vh3MkTmD/9+MkL1svLrkeOcVYtJNJQ/3yX9MfeSeFwrRA
 hXw/briRKXVSB5mc8UXSM9C9AHnxHO3ZndoNe3sU8MFsglz+X7p4sVOX9vSUjd2Odc2C
 E3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rd7e/jtpUxeuvKLkUMh6oQaE/fxz3yxbf4FPN9GQVu0=;
 b=EOOfTlLVmOBT8Ry/SJWYswa6HEvVT6QYavz1i2Vrp4wH8g8APPQdHgE5Ustv+7uZ6Q
 O18gun3ovAdqaZfOvYSPsTsHYQu8UCzCpnNVjWkRWuggaaZ0sKkf15DzpwZ8//d0m17p
 qX4UDLNXbLnEdEPOxQgsd8FT25OPC+xsiyVa62SbKeharAupFNrzqvAGBVo8VItXGaSg
 MPqz/6dvN+4EaTMnH+Zpg6gXj4i+S7NyXfEWEhuvgy4haCwrlP1K8Fktm9MaiRVVAsjM
 Rw5YE8WJ4tZdRSYy2YRhCSAdjW80D3FeveKYMVuXiQ6zIkESm+wwhZSNfnHs4WGt2XYg
 /yEw==
X-Gm-Message-State: AOAM532dDEfe8J6g7eciUTN4iUEPW9Fd4c/0h34YjWVDEitx3mwns+yZ
 p36RUnD1kAINNdeKLNZD4/NcgrAYjQg=
X-Google-Smtp-Source: ABdhPJzidBV+ZOPfmgXq8lG43JGpp3hqDnC4jedoK2nrpg2u65sNTtEoDMoNt1vYZ2NDQZKHKKEfWQ==
X-Received: by 2002:a2e:998d:: with SMTP id w13mr1963138lji.424.1617799229452; 
 Wed, 07 Apr 2021 05:40:29 -0700 (PDT)
Received: from gmail.com (h-155-4-128-43.NA.cust.bahnhof.se. [155.4.128.43])
 by smtp.gmail.com with ESMTPSA id z21sm2439068ljh.104.2021.04.07.05.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 05:40:29 -0700 (PDT)
Date: Wed, 7 Apr 2021 14:40:26 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: Call for an EDID parsing library
Message-ID: <YG2oOtvsHmOfBYMb@gmail.com>
References: <20210407114404.13b41822@eldfell>
 <DJjftAG6WNev87c34XyXFLCHe49rJBCYdqENxfO3uHXUFJXmPerOg5LuQKAbd3D_pdO34vkWgfy9uggujNI12VE-ttglyarF5wAogYC8m3E=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DJjftAG6WNev87c34XyXFLCHe49rJBCYdqENxfO3uHXUFJXmPerOg5LuQKAbd3D_pdO34vkWgfy9uggujNI12VE-ttglyarF5wAogYC8m3E=@emersion.fr>
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
Cc: xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 10:59:18AM +0000, Simon Ser wrote:
> FWIW, with my Sway/wlroots hat on I think this is a great idea and I'd
> definitely be interested in using such as library. A C API with no
> dependencies is pretty important from my point-of-view.
> 
> I'd prefer if C++ was not used at all (and could almost be baited into
> doing the work if that were the case), but it seems that ship has
> sailed already.

The same for Mutter / GNOME, not having to maintain a EDID parser would
be great. Though personally I don't care if it's implemented in C++, C
or whatever, as long as there is a C API to use.


Jonas

> 
> Simon
> _______________________________________________
> wayland-devel mailing list
> wayland-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/wayland-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
