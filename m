Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F02D4245
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 13:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA046EA12;
	Wed,  9 Dec 2020 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F288F6EA12
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 12:41:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9CfLeo061329;
 Wed, 9 Dec 2020 06:41:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607517681;
 bh=gyuNzlVWY1dc3cNd/oMgNdSwOYnZEilTxwUjO6LvZ0s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hzkE5kium29d3zGio3JriNJ2nmTx5+3sUPg2PfgdjX592BK+TYS8iExWXbxTqc7qC
 GTnmIBZbpnD+bVjrxzeZtlxU3o3YJB6n8YvqjxdTYEfvWPn+cETed5SoBOfhBzar7b
 +dYOR8cJBqlpqm07Slb50jnwvJBLTUsonTB9NM5o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9CfLPI120948
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Dec 2020 06:41:21 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 06:41:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 06:41:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9CfJ5S067388;
 Wed, 9 Dec 2020 06:41:19 -0600
Subject: Re: [PATCH] drm/tidss: Use the new api devm_drm_irq_install
To: Daniel Vetter <daniel@ffwll.ch>
References: <1607413859-63365-1-git-send-email-tiantao6@hisilicon.com>
 <20201209004828.GN401619@phenom.ffwll.local>
 <06c1dee7-488d-8a74-a55c-74043cb060cd@ti.com>
 <CAKMK7uFsDPH3+CHGwkgtnDOc6pJY=_SocyaghETZda+RgjAJnQ@mail.gmail.com>
 <327508b7-2c63-8f2c-36a7-362c83b4243d@ti.com>
 <CAKMK7uH25qMZy0fLVTAu+Um5r0A-iCQtGc5yFFwNHXd3KZ3VBQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0eb3f134-877e-4518-2185-8e97cddbfb4d@ti.com>
Date: Wed, 9 Dec 2020 14:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uH25qMZy0fLVTAu+Um5r0A-iCQtGc5yFFwNHXd3KZ3VBQ@mail.gmail.com>
Content-Language: en-US
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
Cc: Dave Airlie <airlied@linux.ie>, Tian Tao <tiantao6@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2020 14:08, Daniel Vetter wrote:
> On Wed, Dec 9, 2020 at 1:06 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>
>> On 09/12/2020 13:56, Daniel Vetter wrote:
>>> On Wed, Dec 9, 2020 at 12:29 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>>>
>>>> On 09/12/2020 02:48, Daniel Vetter wrote:
>>>>> On Tue, Dec 08, 2020 at 03:50:59PM +0800, Tian Tao wrote:
>>>>>> Use devm_drm_irq_install to register interrupts so that
>>>>>> drm_irq_uninstall is not needed to be called.
>>>>>>
>>>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>>>>
>>>>> There's another drm_irq_install in the error path. But I'm not sure this
>>>>> is safe since you're chaning the order in which things get cleaned up now.
>>>>> So leaving this up to Tomi.
>>>>
>>>> Right, I don't think this works. tidss irq_uninstall uses runtime_get/put, which needs to happen
>>>> before pm_runtime_disable. With devm_drm_irq_install that's not the case.
>>>
>>> Hm I don't spot devm_ versions of these, surely we're not the only
>>> ones with this problem?
>>
>> drm-misc-next has these. hisilicon uses it, but doesn't have an irq_uninstall hook, so possibly late
>> uninstall is fine there.
> 
> I meant a devm_ version of pm_runtime_enable. Or some other way to
> make this just work.

I see. No, I don't think we have.

Also, I feel a bit uncomfortable with devm'ified irq request/free. devm is fine for allocs and
reserving stuff, but this one affects the HW state, and your irq handler could get called until devm
frees the irq at some late point of time.

Well, it can be made to work, but just need to be careful. I've had my irq handlers getting called
too early or too late so many times that I'm a bit paranoid about it =).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
