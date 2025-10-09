Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34605BC8F10
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A1910E9E6;
	Thu,  9 Oct 2025 12:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oOT6AYbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB0610E9E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:04:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5FB0F621FB;
 Thu,  9 Oct 2025 12:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0E0C4CEE7;
 Thu,  9 Oct 2025 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760011462;
 bh=mUm9a7u1ihBXgDdOJmtbhRpw4PNkcXoZd5xz425rLz0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oOT6AYbHX2NtOYJGdpPMlp2RVHRO4tO7z4QfX8N5WVR2meCB/v4qodBsOm7M8JpZu
 IpsKsPzLAbbIkuSZPI6tMsJXhlGCVW6XeP0lkpGOZGUi4bhXBi+ZXTt3lGQLZm0lHJ
 Zpfh7Fy/mvT4bPlG7v6A9/06xCCC4X3iTYJTvRDJELQu6yZHfSaS00kT6wKAjX8aZI
 TxwJ257QoLa+oueX5odcDScZ2aFCLmPEqpemH3Navje0Dsi9wRfBeH8Foavqtuwz5X
 9Xg+5vFemCYw/VNoSE/8OiFxlQoe4LWlJNsO//HQ1NVvSugjDqfk+e/HswJGCcmE1m
 42Ik9LZk57HEw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Dodge <bdodge@arcticsand.com>, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
References: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
Subject: Re: (subset) [PATCH] dt-bindings: leds: arc,arc2c0608: Convert to
 DT Schema
Message-Id: <176001145951.2795757.17961348226563861071.b4-ty@kernel.org>
Date: Thu, 09 Oct 2025 13:04:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b87af
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

On Thu, 25 Sep 2025 14:57:58 +0100, Harrison Carter wrote:
> Convert the ArcticSand arc2c0608 LED driver to the dt-schema.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: arc,arc2c0608: Convert to DT Schema
      commit: 24482f2410428ca39d74f92deee38db2c2c6faf3

--
Lee Jones [李琼斯]

