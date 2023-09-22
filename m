Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34D7AB9C6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6FF10E6FE;
	Fri, 22 Sep 2023 19:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1065 seconds by postgrey-1.36 at gabe;
 Fri, 22 Sep 2023 19:04:43 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AD310E6FE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 19:04:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38MIkSKe091507;
 Fri, 22 Sep 2023 13:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1695408388;
 bh=cq21rBVdOpIQWHJQomoMydox8rjIZNV029jEU1u+BA0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=RUtV8dMGc+ffZFwHwkBFZhGlhMRkErwJNIGn43Vsh5vEhoyGLsE+RQDySJ+ZGE4Zc
 nkrzG4sX3h3UtBpLUbwxOAfjeCb4MZK3E8QyjRvpDa/gQ1LcYGWj9i/VA8x2e5NVsS
 js44uEISyfKh7gULgQwAlwwAmZJhTGUwqjvlymtU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38MIkSJB033965
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Sep 2023 13:46:28 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Sep 2023 13:46:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Sep 2023 13:46:27 -0500
Received: from [10.250.38.120] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38MIkQJO022248;
 Fri, 22 Sep 2023 13:46:26 -0500
Message-ID: <7e43a7e0-f6af-94da-59db-377b790ca363@ti.com>
Date: Fri, 22 Sep 2023 13:46:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 04/20] drm/imagination/uapi: Add PowerVR driver UAPI
Content-Language: en-US
To: Adam Jackson <ajax@redhat.com>, Sarah Walker <sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-5-sarah.walker@imgtec.com>
 <CAD_bs+qdnVPYbmtzqcpCC8xdLVNvDb8uNccsd=P6YX+sgMG6Xg@mail.gmail.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CAD_bs+qdnVPYbmtzqcpCC8xdLVNvDb8uNccsd=P6YX+sgMG6Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: matthew.brost@intel.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net, hns@goldelico.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, robh+dt@kernel.org,
 matt.coster@imgtec.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, krzysztof.kozlowski+dt@linaro.org,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/22/23 12:57 PM, Adam Jackson wrote:
> 
> On Wed, Sep 6, 2023 at 5:57 AM Sarah Walker <sarah.walker@imgtec.com <mailto:sarah.walker@imgtec.com>> wrote:
> 
> 
>     + *    :BYPASS_CACHE: There are very few situations where this flag is useful.

Could you also expand on what these few useful situations are?

Andrew

>     + *       By default, the device flushes its memory caches after every job.
> 
> 
> Presumably BYPASS_CACHE does something other than "after every job". Is that "never" or something else? Would be good if the comment was explicit.
> - ajax
