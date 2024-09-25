Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706AF986969
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 01:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219F910E0D5;
	Wed, 25 Sep 2024 23:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="SMz/6Jmf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9426710E28F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 19:37:00 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7B06D23CAD;
 Wed, 25 Sep 2024 21:36:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5kuwsCfjDHF; Wed, 25 Sep 2024 21:36:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1727293018; bh=jNzpilK7Bz1MMyp6+o0M9jtoagRvfncD3J5qPsARZag=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=SMz/6Jmfw9gQX5uIGhphwfp3u4kcXpKBhhW3jAtLVZWI40+EW2AwSw0wl5rEAnvbp
 oz8bmAdL5pjSeYwyEWqbRslIBz8VEwKYz1lJwrbPx6E8tm68ap4M8DNbAyJpZMv7hA
 y1klG79b/1YN9DZ85tAeAM8jOyJZf8MOgxXWPnBdGvsy+mcCcZuS+l4GxVLYXmiVY3
 28AFZLlUL3MBsusG3vgImJvuUmmnUqLgRJEESil72uScxH/2QlkSCkhAuTNQroKTWy
 DCq/cnyvhZl5E/S4bjKogoONGsTbhWt+7P3SAn+W9/RZRWbfilvGhhaVK34JTqd0RB
 PLO48DZ+Mz66w==
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 19:36:58 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 inki.dae@samsung.com, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com, tzimmermann@suse.de, kauschluss@disroot.org
Subject: Re: [PATCH 6/6] dt-bindings: display: samsung,exynos7-decon: add
 exynos7870 compatible
In-Reply-To: <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
 <32ae1188-196d-4fe8-8719-968e5149a771@kernel.org>
 <7e5caaea80390e8cf87ba0a74d9719f0@disroot.org>
 <1bc0ad48-03c0-4cf6-afb1-2296d1c259b9@kernel.org>
Message-ID: <8e0672ad3fd72f69d2bdb5687e778c86@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 25 Sep 2024 23:21:53 +0000
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

On 2024-09-25 19:25, Krzysztof Kozlowski wrote:
> On 25/09/2024 20:42, Kaustabh Chakraborty wrote:
>> On 2024-09-20 12:39, Krzysztof Kozlowski wrote:
>>> On 19/09/2024 17:20, Kaustabh Chakraborty wrote:
>>>> Add the compatible string of Exynos7870 to the existing list.
>>>>
>>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>>
>>> ... and the DTS is <please provide lore ink in changelog>?
>> 
>> Didn't quite understand. The patch adds the compatible string
>> for Exynos7870 DECON in documentation. There's no DTS involved
>> in here, right?
> 
> Provide lore link to the DTS submission.

There aren't any DTS submissions *yet* which use the compatible.
Is that an issue?

> 
> Best regards,
> Krzysztof
