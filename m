Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 543BD2CE0C6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 22:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C3A6EC2E;
	Thu,  3 Dec 2020 21:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22F76EC2E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 21:33:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 22B508050C;
 Thu,  3 Dec 2020 22:33:36 +0100 (CET)
Date: Thu, 3 Dec 2020 22:33:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH drm/hisilicon 2/3] drm/irq: Add the new api to install irq
Message-ID: <20201203213334.GB81406@ravnborg.org>
References: <1606898835-40775-1-git-send-email-tiantao6@hisilicon.com>
 <1606898835-40775-3-git-send-email-tiantao6@hisilicon.com>
 <20201203200711.GA74163@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203200711.GA74163@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=TJU36lUpsagq2rwV8KQA:9 a=CjuIK1q_8ugA:10
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tian,

> > +	ret = devm_add_action_or_reset(dev->dev, devm_drm_irq_uninstall, dev);
> > +	if (ret)
> > +		devm_drm_irq_uninstall(dev);
> devm_add_action_or_reset() will call devm_drm_irq_uninstall() if ret is
> != 0. See include/device.h.
> 
> I guess that is the "_or_reset" part of the name that can tell us that.
> So you can drop the if condition as it just will cause the code to call
> drm_irq_uninstall() twice.

Noticed this was fixed in v2 - so all is fine here.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
