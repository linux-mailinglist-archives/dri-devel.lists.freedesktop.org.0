Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890A36DC55F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 11:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5048310E062;
	Mon, 10 Apr 2023 09:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1052 seconds by postgrey-1.36 at gabe;
 Mon, 10 Apr 2023 09:54:24 UTC
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7A10E062
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 09:54:24 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33A7r9Lt019697; Mon, 10 Apr 2023 04:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=+HukSUvI/kCUUncwKWci9mPfS5LDyGCwR3HBx0GVrAs=;
 b=VyMltFGcMJz9Fo96jwj0voLCc/MyQ6TuYb7AB8OBO0WIQG+3ueNwcRlmimRr5ax8Lalm
 9zqscYCBdnc5TRuyeAGFmcWqCBJQJmHrI56LW7Dk0FGp9YQpas/ojASbr5btgJvIoT73
 S1KxCU8LkHwVei7JvpI8ACVQAq/enUwThmVdGJZpn8Zx2zPyrUYy5PKwdrw6oSfDv1BH
 l95JsMzlvJd2u+xQJCXydr3SCk5dfYCC7jlv4biWfA4bNOXOlsxb68bu+IWlx4sMYaWT
 7NhxKKG4Jl+RSzcPY7sSMV9fHZTXKOOnpzSbeI+XHdFVloRXPQFwFEg5DU57cRqcElXC YQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pu5p3jd3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Apr 2023 04:36:14 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 10 Apr
 2023 04:36:12 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Apr 2023 04:36:12 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7630D11D4;
 Mon, 10 Apr 2023 09:36:12 +0000 (UTC)
Date: Mon, 10 Apr 2023 09:36:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 30/68] hwmon: lochnagar: constify pointers to
 hwmon_channel_info
Message-ID: <20230410093612.GW68926@ediswmail.ad.cirrus.com>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
 <20230406203103.3011503-31-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406203103.3011503-31-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: fWu5-qrICvMoiuyJqdY1n9J2l14KWHY2
X-Proofpoint-GUID: fWu5-qrICvMoiuyJqdY1n9J2l14KWHY2
X-Proofpoint-Spam-Reason: safe
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Eric Tremblay <etremblay@distech-controls.com>, Tom Rix <trix@redhat.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Clemens Ladisch <clemens@ladisch.de>,
 dri-devel@lists.freedesktop.org, Tali Perry <tali.perry1@gmail.com>,
 Rudolf Marek <r.marek@assembler.cz>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Luka Perkov <luka.perkov@sartura.hr>,
 Benjamin Fair <benjaminfair@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, linux-doc@vger.kernel.org,
 Jonas Malaco <jonas@protocubo.io>,
 Derek John Clark <derekjohn.clark@gmail.com>, UNGLinuxDriver@microchip.com,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Aleksa Savic <savicaleksa83@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, openbmc@lists.ozlabs.org,
 Robert Marko <robert.marko@sartura.hr>,
 =?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Agathe Porte <agathe.porte@nokia.com>, linux-rpi-kernel@lists.infradead.org,
 Nick Hawkins <nick.hawkins@hpe.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>, linux-kernel@vger.kernel.org,
 Jack Doan <me@jackdoan.com>, Michael Walle <michael@walle.cc>,
 Marius Zachmann <mail@mariuszachmann.de>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, patches@opensource.cirrus.com,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 10:30:25PM +0200, Krzysztof Kozlowski wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
