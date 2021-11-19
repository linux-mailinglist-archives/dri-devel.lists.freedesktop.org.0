Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F44572C2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 17:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F16B6EE7E;
	Fri, 19 Nov 2021 16:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5568B6EE79;
 Fri, 19 Nov 2021 16:22:14 +0000 (UTC)
Received: from pps.filterd (m0122333.ppops.net [127.0.0.1])
 by mx0a-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJFLKHk028100;
 Fri, 19 Nov 2021 16:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=9YhPnMhtNA7tLEuoFyc4djop0J+S5ShMmbv7d5TlvcM=;
 b=nK1JRSkfkdsISQO8Iz8scJYiOzhmRJBvsJk8VWg6mfGB0dnQ6iZyPbgSL2vux/qi60r1
 SvMzUQSyfsH1lDm1HIGiT37/5rHDHb8Trfsk6M9HjoTXExBTIykERnehYHKcix6zkc8v
 prIN+lbI6l6lJ5Wtmn1ekDbLB9aDem5b+l6lO3+b/7QsDfSNb2iShVYdl06RtPQbx0J6
 BIYOe7PJJP0GCbdRwu1Y19YNCA2u4oyqCcH9xYpbQ/CrStNbvRoG3z+69fuS8kiY+HnN
 H3IG3yGsia2CUtSzInp+C1NMpropJUsRIcqmK0Lz0GhahexiA7CSGIiYan8xNkyyBxk2 Gg== 
Received: from prod-mail-ppoint4
 (a72-247-45-32.deploy.static.akamaitechnologies.com [72.247.45.32] (may be
 forged))
 by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 3cdrf3n5ty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 16:21:39 +0000
Received: from pps.filterd (prod-mail-ppoint4.akamai.com [127.0.0.1])
 by prod-mail-ppoint4.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 1AJGKA8J031865; Fri, 19 Nov 2021 11:21:38 -0500
Received: from prod-mail-relay19.dfw02.corp.akamai.com ([172.27.165.173])
 by prod-mail-ppoint4.akamai.com with ESMTP id 3ccn28ku20-1;
 Fri, 19 Nov 2021 11:21:38 -0500
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay19.dfw02.corp.akamai.com (Postfix) with ESMTP id DFCF4605CD; 
 Fri, 19 Nov 2021 16:21:36 +0000 (GMT)
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
To: Pekka Paalanen <ppaalanen@gmail.com>, seanpaul@chromium.org,
 sean@poorly.run
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211116104631.195cbd0b@eldfell>
 <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
 <20211118172401.0b4d722e@eldfell>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
Date: Fri, 19 Nov 2021 11:21:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211118172401.0b4d722e@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-11-19_06:2021-11-17,
 2021-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190090
X-Proofpoint-ORIG-GUID: wAvvlZeEqbaLEYHr7ZT1eS9bIMmWqfL8
X-Proofpoint-GUID: wAvvlZeEqbaLEYHr7ZT1eS9bIMmWqfL8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190090
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
Cc: intel-gvt-dev@lists.freedesktop.org, quic_saipraka@quicinc.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, Jim Cromie <jim.cromie@gmail.com>,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, mingo@redhat.com,
 rostedt@goodmis.org, amd-gfx@lists.freedesktop.org, quic_psodagud@quicinc.com,
 maz@kernel.org, mathieu.desnoyers@efficios.com, will@kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/18/21 10:24 AM, Pekka Paalanen wrote:
> On Thu, 18 Nov 2021 09:29:27 -0500
> Jason Baron <jbaron@akamai.com> wrote:
> 
>> On 11/16/21 3:46 AM, Pekka Paalanen wrote:
>>> On Fri, 12 Nov 2021 10:08:41 -0500
>>> Jason Baron <jbaron@akamai.com> wrote:
>>>   
>>>> On 11/12/21 6:49 AM, Vincent Whitchurch wrote:  
>>>>> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:    
>>>>>> Sean Paul proposed, in:
>>>>>> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/78133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRA8Dki4A$ 
>>>>>> drm/trace: Mirror DRM debug logs to tracefs
>>>>>>
>>>>>> His patchset's objective is to be able to independently steer some of
>>>>>> the drm.debug stream to an alternate tracing destination, by splitting
>>>>>> drm_debug_enabled() into syslog & trace flavors, and enabling them
>>>>>> separately.  2 advantages were identified:
>>>>>>
>>>>>> 1- syslog is heavyweight, tracefs is much lighter
>>>>>> 2- separate selection of enabled categories means less traffic
>>>>>>
>>>>>> Dynamic-Debug can do 2nd exceedingly well:
>>>>>>
>>>>>> A- all work is behind jump-label's NOOP, zero off cost.
>>>>>> B- exact site selectivity, precisely the useful traffic.
>>>>>>    can tailor enabled set interactively, at shell.
>>>>>>
>>>>>> Since the tracefs interface is effective for drm (the threads suggest
>>>>>> so), adding that interface to dynamic-debug has real potential for
>>>>>> everyone including drm.
>>>>>>
>>>>>> if CONFIG_TRACING:
>>>>>>
>>>>>> Grab Sean's trace_init/cleanup code, use it to provide tracefs
>>>>>> available by default to all pr_debugs.  This will likely need some
>>>>>> further per-module treatment; perhaps something reflecting hierarchy
>>>>>> of module,file,function,line, maybe with a tuned flattening.
>>>>>>
>>>>>> endif CONFIG_TRACING
>>>>>>
>>>>>> Add a new +T flag to enable tracing, independent of +p, and add and
>>>>>> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
>>>>>> the flag checks.  Existing code treats T like other flags.    
>>>>>
>>>>> I posted a patchset a while ago to do something very similar, but that
>>>>> got stalled for some reason and I unfortunately didn't follow it up:
>>>>>
>>>>>  https://urldefense.com/v3/__https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$ 
>>>>>
>>>>> A key difference between that patchset and this patch (besides that
>>>>> small fact that I used +x instead of +T) was that my patchset allowed
>>>>> the dyndbg trace to be emitted to the main buffer and did not force them
>>>>> to be in an instance-specific buffer.    
>>>>
>>>> Yes, I agree I'd prefer that we print here to the 'main' buffer - it
>>>> seems to keep things simpler and easier to combine the output from
>>>> different sources as you mentioned.  
>>>
>>> Hi,
>>>
>>> I'm not quite sure I understand this discussion, but I would like to
>>> remind you all of what Sean's original work is about:
>>>
>>> Userspace configures DRM tracing into a flight recorder buffer (I guess
>>> this is what you refer to "instance-specific buffer").
>>>
>>> Userspace runs happily for months, and then hits a problem: a failure
>>> in the DRM sub-system most likely, e.g. an ioctl that should never
>>> fail, failed. Userspace handles that failure by dumping the flight
>>> recorder buffer into a file and saving or sending a bug report. The
>>> flight recorder contents give a log of all relevant DRM in-kernel
>>> actions leading to the unexpected failure to help developers debug it.
>>>
>>> I don't mind if one can additionally send the flight recorder stream to
>>> the main buffer, but I do want the separate flight recorder buffer to
>>> be an option so that a) unrelated things cannot flood the interesting
>>> bits out of it, and b) the scope of collected information is relevant.
>>>
>>> The very reason for this work is problems that are very difficult to
>>> reproduce in practice, either because the problem itself is triggered
>>> very rarely and randomly, or because the end users of the system have
>>> either no knowledge or no access to reconfigure debug logging and then
>>> reproduce the problem with good debug logs.
>>>
>>> Thank you very much for pushing this work forward!
>>>
>>>   
>>
>> So I think Vincent (earlier in the thread) was saying that he finds it
>> very helpful have dynamic debug output go to the 'main' trace buffer,
>> while you seem to be saying you'd prefer it just go to dynamic debug
>> specific trace buffer.
> 
> Seems like we have different use cases: traditional debugging, and
> in-production flight recorder for problem reporting. I'm not surprised
> if they need different treatment.
> 
>> So we certainly can have dynamic output potentially go to both places -
>> although I think this would mean two tracepoints? But I really wonder
>> if we really need a separate tracing buffer for dynamic debug when
>> what goes to the 'main' buffer can be controlled and filtered to avoid
>> your concern around a 'flood'?
> 
> If the DRM tracing goes into the main buffer, then systems in
> production cannot have any other sub-system traced in a similar
> fashion. To me it would feel very arrogant to say that to make use of
> DRM flight recording, you cannot trace much or anything else.
> 
> The very purpose of the flight recorder is run in production all the
> time, not in a special debugging session.
> 
> There is also the question of access and contents of the trace buffer.
> Ultimately, if automatic bug reports are enabled in a system, the
> contents of the trace buffer would be sent as-is to some bug tracking
> system. If there is a chance to put non-DRM stuff in the trace buffer,
> that could be a security problem.
> 
> My use case is Weston. When Weston encounters an unexpected problem in
> production, something should automatically capture the DRM flight
> recorder contents and save it alongside the Weston log. Would be really
> nice if Weston itself could do that, but I suspect it is going to need
> root privileges so it needs some helper daemon.
> 
> Maybe Sean can reiterate their use case more?
> 
> 
> Thanks,
> pq
> 

Ok, so in this current thread the proposal was to create a "dyndbg-tracefs"
buffer to put the dynamic debug output (including drm output from dynamic
debug) into. And I was saying let's just put in the 'main' trace buffer
(predicated on a dynamic debug specific tracepoint), since there seems
to be a a use-case for that and it keeps things simpler.

But I went back to Sean's original patch, and it creates a drm specific
trace buffer "drm" (via trace_array_get_by_name("drm")). Here:
https://patchwork.freedesktop.org/patch/445549/?series=78133&rev=5

So I think that may be some of the confusion here? The current thread/
proposal is not for a drm specific trace buffer...

Having a subsystem specific trace buffer would allow subsystem specific
trace log permissions depending on the sensitivity of the data. But
doesn't drm output today go to the system log which is typically world
readable today?

So I could see us supporting subsystem specific trace buffer output
via dynamic debug here. We could add new dev_debug() variants that
allow say a trace buffer to be supplied. So in that way subsystems
could 'opt-out' of having their data put into the global trace buffer.
And perhaps some subsystems we would want to allow output to both
buffers? The subsystem specific one and the global one?

Thanks,

-Jason




