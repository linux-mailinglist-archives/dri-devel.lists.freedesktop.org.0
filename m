Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2F1A0C78
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 13:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68546E830;
	Tue,  7 Apr 2020 11:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820736E830
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=27o2R3/ovp9UHYCHHqNhJMoGxTTyzloAiIQ7a8ozxjY=; b=YOpevshxOZVvvV4SqIFBt09bW2
 JyQkTr9vRc9hUEZnmAUXlyVoQO0AN9YLg1iik5iOj+APuG++ShBW7758DgIeCM88lcZI1P5UC+F50
 jN6kysYY5eq5bWoQni6qCnQDmJHC862EUjTn10LsGL18KyawFtk+i75Q6mkiSE+WcEdGsXl0W6ZvK
 zUNH1Ko91iCToQqA6EyiDYOTem0O2g+RBMcY2nYwJdb7MNyIEhbtAUJbWLQf7IPVm655LQ68+7i5+
 Fp975heF3spZmU6qXvcVSwkno0I/pJBhKjTztJs+xlUApK8M56aobpe1aEOt2xOhEPDalhuW3YNzA
 WLTPaCOA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52532
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jLm1X-0001nB-QB; Tue, 07 Apr 2020 13:04:07 +0200
Subject: Re: [PATCH 05/10] drm/mediathek: Remove error check from fbdev setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406134405.6232-6-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <78a784fe-bbd9-8550-e134-6313185b3a72@tronnes.org>
Date: Tue, 7 Apr 2020 13:04:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406134405.6232-6-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 06.04.2020 15.44, skrev Thomas Zimmermann:
> Remove the error check from the fbdev setup function. The function
> will print a warning.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Subject: s/mediathek/mediatek/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
