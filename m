Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A962682D958
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 13:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBAA10E279;
	Mon, 15 Jan 2024 12:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F9C10E279
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705323590;
 bh=CvC7OwAUWMZy85wzIU40G5xQbvp+BqG3iEMGeNBU1S0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hy69LmlrV6xKeSuXPT1Js8whP9C0dccOzxhjsrfP0c9QIhjfE7nFFoo1WtWQZ/5y5
 YDTsI/QWfq9LugTCwhTADr5ctUB4zQ2Wvx64WJ/cR6Ide8iolJxkkz96LYJZzXlmTX
 QUxT3tsfMRtowJXt9xn5oCJkgBRr7jqNwuxGq1WEYiHvfKiMruazbdJwjm/FYmiO3r
 JM4ICqbRzwruRm46D4ZgmrRnNX/WMkBaZ4mLqbBJT6zFYRATHMecLj2YgLFsyjJ8oK
 2QJPcGuTukn6SYUZLtBZ7FoVQoF9G55dUe9zIrCxep6vjq6P+ki0VgjYcVCwFcuF10
 ZxuwHU5ivmoxw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1E9213780624;
 Mon, 15 Jan 2024 12:59:49 +0000 (UTC)
Date: Mon, 15 Jan 2024 13:59:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v3 11/14] drm/panthor: Add the driver frontend block
Message-ID: <20240115135947.07f0487e@collabora.com>
In-Reply-To: <ZYMVMV3pkSP1s41W@e110455-lin.cambridge.arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-12-boris.brezillon@collabora.com>
 <ZYMVMV3pkSP1s41W@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Dec 2023 16:24:17 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> > +/**
> > + * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
> > + * @in: The object array to copy.
> > + * @min_stride: Minimum array stride.
> > + * @obj_size: Kernel object size.
> > + *
> > + * Helper automating user -> kernel object copies.
> > + *
> > + * Don't use this function directly, use PANTHOR_UOBJ_ARRAY_GET() instead.  
> 
> Looks like the macro is called PANTHOR_UOBJ_GET_ARRAY().

Will fix.

Thanks!

Boris
