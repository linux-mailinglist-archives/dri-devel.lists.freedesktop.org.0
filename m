Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D63589302
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 22:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7FE11A469;
	Wed,  3 Aug 2022 20:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB9A14A264;
 Wed,  3 Aug 2022 20:13:12 +0000 (UTC)
Received: from pps.filterd (m0050095.ppops.net [127.0.0.1])
 by m0050095.ppops.net-00190b01. (8.17.1.5/8.17.1.5) with ESMTP id
 273K6ECw014461; Wed, 3 Aug 2022 21:13:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=kD8ss4llw9emi1q/V/qOWVYNBs8Bf2P/+bRbIeXTpIc=;
 b=aRyy5Ac0EJhd6yNjtIP1JinrWeLwFVweLx00myISLsbXlVkq6tioeCsD4ZYE1c8U2wO7
 HsI+lkhf3C6pmRVqiTZMhJTWxmJEOAxoPwSt3BC4WhkGHo4BY52JcJsAkXxfgJI6rJ42
 SzxGBtdS0MdHi8/59A4k/+ktLsm+gmXU38RlqobOqWDiFp4ReIg5R777gNc1AV8XChPs
 pc4ocZoP+Nicn69O99t44gO9v7UVucw5Dh6J2qRwOPLMTtDjlmXwjiH0o9n3NXeqV1QV
 uUP6wWJaWhV4YbUcFytWaC0sU/pEC2+JSeolCmA5a1TT66JABunlawrt0i47a2mTB+E0 vw== 
Received: from prod-mail-ppoint3
 (a72-247-45-31.deploy.static.akamaitechnologies.com [72.247.45.31] (may be
 forged))
 by m0050095.ppops.net-00190b01. (PPS) with ESMTPS id 3hq1mj7urc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Aug 2022 21:13:08 +0100
Received: from pps.filterd (prod-mail-ppoint3.akamai.com [127.0.0.1])
 by prod-mail-ppoint3.akamai.com (8.17.1.5/8.17.1.5) with ESMTP id
 273K33ol029194; Wed, 3 Aug 2022 16:13:07 -0400
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
 by prod-mail-ppoint3.akamai.com (PPS) with ESMTP id 3hnj5np10n-1;
 Wed, 03 Aug 2022 16:13:07 -0400
Received: from [0.0.0.0] (unknown [172.27.119.138])
 by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id F26F19A;
 Wed,  3 Aug 2022 20:13:05 +0000 (GMT)
Message-ID: <17628790-3905-460d-8734-981cfa8e7e51@akamai.com>
Date: Wed, 3 Aug 2022 16:13:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 00/41] DYNDBG: opt-in class'd debug for modules, use in
 drm.
Content-Language: en-US
To: jim.cromie@gmail.com, dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, robdclark@gmail.com
References: <20220720153233.144129-1-jim.cromie@gmail.com>
 <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <CAJfuBxxPRj-u5S45pPfAEaE46ji0--MTVxryEAUPe1+1c1jgEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_06,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208030083
X-Proofpoint-ORIG-GUID: YJDbZqBVShtN-ycveY6w8PPO7vF9drUE
X-Proofpoint-GUID: YJDbZqBVShtN-ycveY6w8PPO7vF9drUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_06,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208030084
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



On 8/3/22 15:56, jim.cromie@gmail.com wrote:
> On Wed, Jul 20, 2022 at 9:32 AM Jim Cromie <jim.cromie@gmail.com> wrote:
>>
> 
>> Hi Jason, Greg, DRM-folk,
>>
>> This adds 'typed' "class FOO" support to dynamic-debug, where 'typed'
>> means either DISJOINT (like drm debug categories), or VERBOSE (like
>> nouveau debug-levels).  Use it in DRM modules: core, helpers, and in
>> drivers i915, amdgpu, nouveau.
>>
> 
> This revision fell over, on a conflict with something in drm-MUMBLE
> 
> Error: patch https://urldefense.com/v3/__https://patchwork.freedesktop.org/api/1.0/series/106427/revisions/2/mbox/__;!!GjvTz_vk!UCPl5Uf32cDVwwysMTfaLwoGLWomargFXuR8HjBA3xsUOjxXHXC5hneAkP4iWK91yc-LjjJxWW89-51Z$ 
> not applied
> Applying: dyndbg: fix static_branch manipulation
> Applying: dyndbg: fix module.dyndbg handling
> Applying: dyndbg: show both old and new in change-info
> Applying: dyndbg: reverse module walk in cat control
> Applying: dyndbg: reverse module.callsite walk in cat control
> Applying: dyndbg: use ESCAPE_SPACE for cat control
> Applying: dyndbg: let query-modname override actual module name
> Applying: dyndbg: add test_dynamic_debug module
> Applying: dyndbg: drop EXPORTed dynamic_debug_exec_queries
> 
> Jason,
> those above are decent maintenance patches, particularly the drop export.
> It would be nice to trim this unused api this cycle.

Hi Jim,

Agreed - I was thinking the same thing. Feel free to add
Acked-by: Jason Baron <jbaron@akamai.com> to those first 9.



> 
> Applying: dyndbg: add class_id to pr_debug callsites
> Applying: dyndbg: add __pr_debug_cls for testing
> Applying: dyndbg: add DECLARE_DYNDBG_CLASSMAP
> Applying: kernel/module: add __dyndbg_classes section
> Applying: dyndbg: add ddebug_attach_module_classes
> Applying: dyndbg: validate class FOO by checking with module
> Applying: dyndbg: add drm.debug style bitmap support
> Applying: dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes
> Applying: doc-dyndbg: describe "class CLASS_NAME" query support
> Applying: doc-dyndbg: edit dynamic-debug-howto for brevity, audience
> Applying: drm_print: condense enum drm_debug_category
> Applying: drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.
> Applying: drm_print: interpose drm_*dbg with forwarding macros
> Applying: drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
> Using index info to reconstruct a base tree...
> M drivers/gpu/drm/Kconfig
> M drivers/gpu/drm/Makefile
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/gpu/drm/Makefile
> Auto-merging drivers/gpu/drm/Kconfig
> CONFLICT (content): Merge conflict in drivers/gpu/drm/Kconfig
> error: Failed to merge in the changes.
> 
> 
> Before I resend, I should sort out that possible conflict
> which tree is patchwork applied upon ?
> 
> or was it just transient ? after 5.19 I rebased a copy onto drm-next/drm-next,
> and there was nothing to fix - I will revisit presently..


Not sure, if it's a minor conflict maybe Greg KH can sort it when
he pulls it in? If not yeah might be important to rebase first...Greg?

Thanks,

-Jason
