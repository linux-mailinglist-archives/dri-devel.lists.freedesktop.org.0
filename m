Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56285292D9A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 20:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C076EA33;
	Mon, 19 Oct 2020 18:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18166EA30;
 Mon, 19 Oct 2020 18:33:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22760069-1500050 for multiple; Mon, 19 Oct 2020 19:33:33 +0100
MIME-Version: 1.0
In-Reply-To: <20201019182936.GA3149316@intel.com>
References: <20201006145632.117291-1-srinivasx.k@intel.com>
 <2f7809798dd0b59246d67c5044dafb1e518fc4c5.camel@intel.com>
 <160200650945.2919.11750150118902885340@build.alporthouse.com>
 <3CDB63EE-D1CD-43E4-A977-4E966CD19313@intel.com>
 <c88bc0fbc4956395324674ca202b395326208888.camel@intel.com>
 <BYAPR11MB3014087624B8206C05362830F9080@BYAPR11MB3014.namprd11.prod.outlook.com>
 <B6C174E8-161A-43BD-AFDA-21C94F6D56E3@intel.com>
 <BY5PR11MB44341733BF4A7CCB79861322F6080@BY5PR11MB4434.namprd11.prod.outlook.com>
 <BYAPR11MB30149153D9229142DD2CF96BF9020@BYAPR11MB3014.namprd11.prod.outlook.com>
 <20201019182936.GA3149316@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ehl: Remove require_force_probe
 protection
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "K, SrinivasX" <srinivasx.k@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 19 Oct 2020 19:33:32 +0100
Message-ID: <160313241261.4425.3184593266306110227@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Souza,
 Jose" <jose.souza@intel.com>, "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rodrigo Vivi (2020-10-19 19:29:36)
> 
> I just checked the CI picture and it looks much better indeed.
> 
> Only bad case being the gt_pm, which is also failing on other platforms.

Not nearly in the same manner. CI is indicating that there is no RC6
entry and no power saving at all; neither in the selftests nor visible
from userspace. That is a critical battery eating bug.

If there's a patch to fix it for ehl and jsl, send it to CI for proving.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
