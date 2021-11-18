Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4CB455E08
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 15:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9E96E95C;
	Thu, 18 Nov 2021 14:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B75D6E96C;
 Thu, 18 Nov 2021 14:30:41 +0000 (UTC)
Received: from pps.filterd (m0050096.ppops.net [127.0.0.1])
 by m0050096.ppops.net-00190b01. (8.16.1.2/8.16.1.2) with ESMTP id
 1AIBKkIv005884; Thu, 18 Nov 2021 14:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=EEv+FO0y2LcqM6PtDCyOArBwCLcxVvnGTnV08q5cqI8=;
 b=Idci0ujFpG3jtuCOuphPhIyMPpDzd5jCyJYZOmtKJTGkLCERXkSH3wcbAMdk9gVmJm+H
 YDbEK+jUygH6ci5qP1UHTxs+AxWiIrRHPsHDGuYOqJvp+457GfAT7AZOFEIVIvanYWvZ
 cy/J+/X7EA5rFT8quo9FuATXp5KPGLhk7F6+C66o8jZb2RKBRgzmOidWTJfvfw5Vw23j
 ZWq2uaYUaAVOCPqPY1jM1krTTcTUl20PWIcGAdh+XCIfkjIGr8HYmIrK0xxPVpDxTyK0
 a6EOxiUmF1MrznpM4CZAj+iypwVjkAkumF4V9snAwT6Lulcrv1OvRFd8OGypNmyE+JfZ 9g== 
Received: from prod-mail-ppoint8
 (a72-247-45-34.deploy.static.akamaitechnologies.com [72.247.45.34] (may be
 forged))
 by m0050096.ppops.net-00190b01. (PPS) with ESMTPS id 3cdnvjuq7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 14:30:05 +0000
Received: from pps.filterd (prod-mail-ppoint8.akamai.com [127.0.0.1])
 by prod-mail-ppoint8.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 1AIEK558022965; Thu, 18 Nov 2021 09:29:29 -0500
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
 by prod-mail-ppoint8.akamai.com with ESMTP id 3ccjst50g6-1;
 Thu, 18 Nov 2021 09:29:29 -0500
Received: from [0.0.0.0] (unknown [172.27.119.138])
 by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id 2366F3DA;
 Thu, 18 Nov 2021 14:29:28 +0000 (GMT)
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211116104631.195cbd0b@eldfell>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
Date: Thu, 18 Nov 2021 09:29:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211116104631.195cbd0b@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-11-18_12:2021-11-17,
 2021-11-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180080
X-Proofpoint-ORIG-GUID: PZH91yPu5Slhl0tBH1YNzfOEtC8OZPwU
X-Proofpoint-GUID: PZH91yPu5Slhl0tBH1YNzfOEtC8OZPwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_12,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180081
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
Cc: quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, will@kernel.org,
 intel-gvt-dev@lists.freedesktop.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 amd-gfx@lists.freedesktop.org, mingo@redhat.com, daniel.vetter@ffwll.ch,
 arnd@arndb.de, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, Jim Cromie <jim.cromie@gmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 quic_psodagud@quicinc.com, maz@kernel.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/21 3:46 AM, Pekka Paalanen wrote:
> On Fri, 12 Nov 2021 10:08:41 -0500
> Jason Baron <jbaron@akamai.com> wrote:
> 
>> On 11/12/21 6:49 AM, Vincent Whitchurch wrote:
>>> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:  
>>>> Sean Paul proposed, in:
>>>> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/78133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRA8Dki4A$ 
>>>> drm/trace: Mirror DRM debug logs to tracefs
>>>>
>>>> His patchset's objective is to be able to independently steer some of
>>>> the drm.debug stream to an alternate tracing destination, by splitting
>>>> drm_debug_enabled() into syslog & trace flavors, and enabling them
>>>> separately.  2 advantages were identified:
>>>>
>>>> 1- syslog is heavyweight, tracefs is much lighter
>>>> 2- separate selection of enabled categories means less traffic
>>>>
>>>> Dynamic-Debug can do 2nd exceedingly well:
>>>>
>>>> A- all work is behind jump-label's NOOP, zero off cost.
>>>> B- exact site selectivity, precisely the useful traffic.
>>>>    can tailor enabled set interactively, at shell.
>>>>
>>>> Since the tracefs interface is effective for drm (the threads suggest
>>>> so), adding that interface to dynamic-debug has real potential for
>>>> everyone including drm.
>>>>
>>>> if CONFIG_TRACING:
>>>>
>>>> Grab Sean's trace_init/cleanup code, use it to provide tracefs
>>>> available by default to all pr_debugs.  This will likely need some
>>>> further per-module treatment; perhaps something reflecting hierarchy
>>>> of module,file,function,line, maybe with a tuned flattening.
>>>>
>>>> endif CONFIG_TRACING
>>>>
>>>> Add a new +T flag to enable tracing, independent of +p, and add and
>>>> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
>>>> the flag checks.  Existing code treats T like other flags.  
>>>
>>> I posted a patchset a while ago to do something very similar, but that
>>> got stalled for some reason and I unfortunately didn't follow it up:
>>>
>>>  https://urldefense.com/v3/__https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$ 
>>>
>>> A key difference between that patchset and this patch (besides that
>>> small fact that I used +x instead of +T) was that my patchset allowed
>>> the dyndbg trace to be emitted to the main buffer and did not force them
>>> to be in an instance-specific buffer.  
>>
>> Yes, I agree I'd prefer that we print here to the 'main' buffer - it
>> seems to keep things simpler and easier to combine the output from
>> different sources as you mentioned.
> 
> Hi,
> 
> I'm not quite sure I understand this discussion, but I would like to
> remind you all of what Sean's original work is about:
> 
> Userspace configures DRM tracing into a flight recorder buffer (I guess
> this is what you refer to "instance-specific buffer").
> 
> Userspace runs happily for months, and then hits a problem: a failure
> in the DRM sub-system most likely, e.g. an ioctl that should never
> fail, failed. Userspace handles that failure by dumping the flight
> recorder buffer into a file and saving or sending a bug report. The
> flight recorder contents give a log of all relevant DRM in-kernel
> actions leading to the unexpected failure to help developers debug it.
> 
> I don't mind if one can additionally send the flight recorder stream to
> the main buffer, but I do want the separate flight recorder buffer to
> be an option so that a) unrelated things cannot flood the interesting
> bits out of it, and b) the scope of collected information is relevant.
> 
> The very reason for this work is problems that are very difficult to
> reproduce in practice, either because the problem itself is triggered
> very rarely and randomly, or because the end users of the system have
> either no knowledge or no access to reconfigure debug logging and then
> reproduce the problem with good debug logs.
> 
> Thank you very much for pushing this work forward!
> 
> 

So I think Vincent (earlier in the thread) was saying that he finds it
very helpful have dynamic debug output go to the 'main' trace buffer,
while you seem to be saying you'd prefer it just go to dynamic debug
specific trace buffer.

So we certainly can have dynamic output potentially go to both places -
although I think this would mean two tracepoints? But I really wonder
if we really need a separate tracing buffer for dynamic debug when
what goes to the 'main' buffer can be controlled and filtered to avoid
your concern around a 'flood'?

Thanks,

-Jason

