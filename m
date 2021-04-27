Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6F36C509
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 13:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24D16E05D;
	Tue, 27 Apr 2021 11:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64286E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 11:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y4KXqSP0dGeaDdsm6h7KoKa8Vab174WfyqgTKmP0FrE=; b=hWgxmAvlXk1TD8d0/4fuy2rUQm
 nYFDy4jfEsCu/aZP+V48Z9p0aLiTsinMcZbsmemIWDpcM5CPhllFOSrSiEOMlycchzm9hV+L/9bQt
 mornNkHoxkjiW5W0YRwaa03jy8TDOyLsZ9nT0De053Wa2KC7q7InDMJRyREUFQ78/FGGbbwtWYInY
 TZPKYlWpGBP0jgf13bVWp5/NU5OeV44zVMEhResFSP7QW0EQRJLXX1AHCcwhgJ9npg6V1qnVHJJ/I
 RtEvCq6HIm7cJoGmHL6O0924c9YKwO2/l9PbeCBNThjYNntUg3o/2HhZ+U3pgfdKSG1YlCp0lmUvm
 zWkLonhQ==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=61503)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lbLsK-0006Dv-6n; Tue, 27 Apr 2021 13:27:32 +0200
Subject: Re: [PATCH v1 1/7] drm/st7735r: Avoid spamming logs if probe is
 deferred
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210421163157.50949-1-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <63e7b758-a1c0-db7c-6523-53d08c2f8726@tronnes.org>
Date: Tue, 27 Apr 2021 13:27:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210421163157.50949-1-andriy.shevchenko@linux.intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.04.2021 18.31, skrev Andy Shevchenko:
> The GPIO request can fail and probe may be deferred. Thus,
> the error message may be printed again and again. Avoid
> this by replacing DRM_DEV_ERROR() by dev_err_probe().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Series is applied to drm-misc-next.

Thanks,
Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
