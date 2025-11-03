Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEB6C2EE9A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 03:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CD510E506;
	Tue,  4 Nov 2025 02:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RtgfVc6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E152D10E506
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 02:05:00 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0sGd5r2Xz9th6;
 Tue,  4 Nov 2025 03:04:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762221897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0yWbu7y1QVa2c8kKeP3bloSf5n0MlRqUOGmDNRFYWs=;
 b=RtgfVc6BU5L52qXx6mbD7p7VtqF4yj+yLn55bS3cm5xcC4cm9RS19rhx7NeFUYWAsg8KpG
 E8A+X2LgR4HdJRRXGiyl6zt3aCz38ZsfLE+ssHatAOXcdM7+29FsSUW0WZm/yzWChe+XDi
 CRF1VpVsx8xqcG7FVeD38C3U9unZ3XbB4ys7Df1kL2e8DEj/nEN2BW+10XY0v4sCkzO+sH
 gYbSDjqwNPHG0/Xx43THSDWf0dE0uXHBdTBAdxr1q40ImSVqONPKXIiYQ8IjrDq0qdSjnV
 7CY3eG+avTc+gbbY66ug9hli5gN7Ix4L/Ig5Pc18wCXOfMyYpptResjQWu9RzA==
Message-ID: <b8f61be8-281a-4057-bb05-c7d106e53f01@mailbox.org>
Date: Tue, 4 Nov 2025 00:47:58 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: shawnguo2@yeah.net, airlied@gmail.com, boris.brezillon@collabora.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, simona@ffwll.ch, sre@kernel.org, steven.price@arm.com,
 tzimmermann@suse.de, xianzhong.li@nxp.com
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org> <aP7DZCMk1pQ7wsFo@dragon>
 <aQB88c_AEC1RAZtH@oss.nxp.com> <aQCIAfyUC6N5y2fB@dragon>
 <f9057853-8b43-4ab6-ae65-ee5e4d569c46@mailbox.org>
 <aQhd0Ri4CviuGMOE@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aQhd0Ri4CviuGMOE@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: azhnsga89ktmxpihnm4emkymm3cay3uo
X-MBO-RS-ID: ab159e2ebd1e51d8cf5
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

On 11/3/25 8:46 AM, Rain Yang wrote:

Hello Rain,

> thanks for your patch to make i.MX95 GPU upstreamed.
> Maybe I didn't express it clearly in the previous e-mails.
> the always-on GPUAPB clock must be removed, otherwise, it will result in redundant and unnecessary
> function call to M33.

DT should describe the hardware fully, that means DT should also 
describe the clock. Why should this clock description be removed from DT 
? The SCMI clock call over SMT transport is cheap.

-- 
Best regards,
Marek Vasut
