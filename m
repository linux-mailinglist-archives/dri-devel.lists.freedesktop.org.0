Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54060FC07
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE7410E681;
	Thu, 27 Oct 2022 15:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1406 seconds by postgrey-1.36 at gabe;
 Thu, 27 Oct 2022 15:32:42 UTC
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E28810E681;
 Thu, 27 Oct 2022 15:32:42 +0000 (UTC)
Received: from pps.filterd (m0050095.ppops.net [127.0.0.1])
 by m0050095.ppops.net-00190b01. (8.17.1.5/8.17.1.5) with ESMTP id
 29REAqMV008104; Thu, 27 Oct 2022 16:08:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=h4lND8L7nF8jQSiuXHvwarM3PypjNGIv6eeSvOJK9Xc=;
 b=WI1sr5VyksXvBeCZiuQvHynoUgIvJ8arwsnOScd2R1Cy8hD2FJjGzA2CbJctUmDI1aBt
 Qk/eTkHTCLRbUgK6KW8gHgXZ2asZKdOCSMNbaIDldll4yl99Nr901x4zbS0hnbSxhoU4
 1rl3y+Ye4FoGzQ0CK2mI+Q8gTT3Kz5KW0v4YU7AOlfThbhg0PpPsXVaEiEgTpIlXbIgN
 PBCyNVmLOiHqt8UCdPuiYECX4fVk0SXxYzmHtLTOrOZzdq1/KzaYrAuhpHTS/sd3vtJb
 f3aF7AQ36RKi66wgEwZ2K8A+0LUh17YQ1A1kr5XY5HbF069FllZb7CFq4ULBXdIIWDhf pA== 
Received: from prod-mail-ppoint7
 (a72-247-45-33.deploy.static.akamaitechnologies.com [72.247.45.33] (may be
 forged))
 by m0050095.ppops.net-00190b01. (PPS) with ESMTPS id 3kfb8p84nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 16:08:19 +0100
Received: from pps.filterd (prod-mail-ppoint7.akamai.com [127.0.0.1])
 by prod-mail-ppoint7.akamai.com (8.17.1.5/8.17.1.5) with ESMTP id
 29RDDmRu005239; Thu, 27 Oct 2022 11:08:18 -0400
Received: from prod-mail-relay19.dfw02.corp.akamai.com ([172.27.165.173])
 by prod-mail-ppoint7.akamai.com (PPS) with ESMTP id 3kfaq1mk0q-1;
 Thu, 27 Oct 2022 11:08:17 -0400
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay19.dfw02.corp.akamai.com (Postfix) with ESMTP id E582360293; 
 Thu, 27 Oct 2022 15:08:16 +0000 (GMT)
Message-ID: <c1807585-f6c8-c05d-bc20-c6a540e59814@akamai.com>
Date: Thu, 27 Oct 2022 11:08:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v7 0/9] dyndbg: drm.debug adaptation
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <Yy7/6oTBW2lqVSK1@kroah.com> <Y1Fyuh12g/gt3Izn@intel.com>
 <87a65pfsbq.fsf@intel.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <87a65pfsbq.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270082
X-Proofpoint-ORIG-GUID: JKKURTnn4jQ6E0EgMWxXuBHamgEYkVRY
X-Proofpoint-GUID: JKKURTnn4jQ6E0EgMWxXuBHamgEYkVRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2210270082
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/21/22 05:18, Jani Nikula wrote:
> On Thu, 20 Oct 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Sat, Sep 24, 2022 at 03:02:34PM +0200, Greg KH wrote:
>>> On Sun, Sep 11, 2022 at 11:28:43PM -0600, Jim Cromie wrote:
>>>> hi Greg, Dan, Jason, DRM-folk,
>>>>
>>>> heres follow-up to V6:
>>>>   rebased on driver-core/driver-core-next for -v6 applied bits (thanks)
>>>>   rework drm_debug_enabled{_raw,_instrumented,} per Dan.
>>>>
>>>> It excludes:
>>>>   nouveau parts (immature)
>>>>   tracefs parts (I missed --to=Steve on v6)
>>>>   split _ddebug_site and de-duplicate experiment (way unready)
>>>>
>>>> IOW, its the remaining commits of V6 on which Dan gave his Reviewed-by.
>>>>
>>>> If these are good to apply, I'll rebase and repost the rest separately.
>>>
>>> All now queued up, thanks.
>>
>> This stuff broke i915 debugs. When I first load i915 no debug prints are
>> produced. If I then go fiddle around in /sys/module/drm/parameters/debug
>> the debug prints start to suddenly work.
> 
> Wait what? I always assumed the default behaviour would stay the same,
> which is usually how we roll. It's a regression in my books. We've got a
> CI farm that's not very helpful in terms of dmesg logging right now
> because of this.
> 
> BR,
> Jani.
> 
> 

That doesn't sound good - so you are saying that prior to this change some
of the drm debugs were default enabled. But now you have to manually enable
them?

Thanks,

-Jason
