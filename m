Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE78388BA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 09:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D2910E6EF;
	Tue, 23 Jan 2024 08:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com
 [95.215.58.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4F610E6EF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 08:20:42 +0000 (UTC)
Message-ID: <95a7a0b2-615d-49ca-b568-1376a35493c4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705998011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EVIkQhPcPlKe9b1S3Oh/Jh/ARelid6N/hSItWhRruMc=;
 b=pai4CYDWSFYrNAEz5Le4VbHGOdlkmeMmxX2x9egYjwZxK2QxyKjmbZoChEFKhKiEAhL//F
 TffwO4uNuajr5n7sZxJmzOGhKIkDLZmIQY15V2eyP+dOO1ws+2rAto5EnpKS/o+T7bsS31
 pC7n4hpvGcr8Uw8T6LNT16azEc7GHZ4=
Date: Tue, 23 Jan 2024 16:20:04 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] drm/bridge: simple-bridge: Extend match support for
 non-DT based systems
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-3-sui.jingfeng@linux.dev>
 <20240123012139.GD22880@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240123012139.GD22880@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/1/23 09:21, Laurent Pinchart wrote:
> On Tue, Jan 23, 2024 at 12:32:17AM +0800, Sui Jingfeng wrote:
>> Which is intended to be used on non-DT environment, where the simple-bridge
>> platform device is created by either the display controller driver side or
>> platform firmware subsystem.
> Could you give an example of a platform where you intend to use this ?


For example:

1) USB based display adapter, such as FL2000DX[1] which use
    the it66121 HDMI transmitter to convert the RGB888 to HDMI.


2) Simple 2D PCIe display controller, such as SM750(EMPV-1201)
    which using sii9022 HDMI transmitter to convert the RGB888
    to HDMI.


3) Some FPGA PCIe Board (sil9136)

4) Be able to run unit test of drm bridges on X86.
  
[1] https://github.com/FrescoLogic/FL2000

