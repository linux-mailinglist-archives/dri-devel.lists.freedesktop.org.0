Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB4DB379C4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 07:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A18110E0B1;
	Wed, 27 Aug 2025 05:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="fFfa87uM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF72E10E062;
 Wed, 27 Aug 2025 05:27:20 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QJuQZo029875;
 Wed, 27 Aug 2025 05:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=jxijss
 tmEiNGZJKG6yltOja4dBZKrqMyUi/HgZLz1Sk=; b=fFfa87uMu8acvDC8OVnLiF
 3Gw7T94UM/oONEZ9FfO6ESJm9dykU5EYEWzJ6thKl8AEybeSnU7jVczC+OsbSmIg
 U1DTm1ikvBxQhtMsBkqiirIjOSbWdtCJnpSDht3JKVzPoBOjH3KPPIjRZwjgIoz4
 PIz+4T0pathmf8bjMQQcBo9Nngpp8r0YuSt99tds0+EviRwkVU+5p0dMPKzJ5SJZ
 NqSby3CqAv1CiFuqsjN+UtUj0P6MofPcWemNISQn5nz/ZN8twBsE28xbYF1o/y5D
 T+rxMTdyXFQiS1FQNk9wuoFsc0iqqXm08NakEBDb3JoIMWYZ+sB++DfGZXvYi8bQ
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j2cs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Aug 2025 05:27:07 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57R5K8Rl017639;
 Wed, 27 Aug 2025 05:27:06 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j2cs6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Aug 2025 05:27:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57R3lXEH029924;
 Wed, 27 Aug 2025 05:27:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfmpe9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Aug 2025 05:27:05 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 57R5R1oh53739874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Aug 2025 05:27:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6821520049;
 Wed, 27 Aug 2025 05:27:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A772520040;
 Wed, 27 Aug 2025 05:27:00 +0000 (GMT)
Received: from [9.152.212.92] (unknown [9.152.212.92])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 27 Aug 2025 05:27:00 +0000 (GMT)
Message-ID: <ac6dfaec-38ea-486d-89a0-ab02768cee42@linux.ibm.com>
Date: Wed, 27 Aug 2025 07:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] perf: Introduce positive capability for raw events
To: Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>, 
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Jan Polensky <japo@linux.ibm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org, acme@kernel.org, 
 namhyung@kernel.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
 kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1755096883.git.robin.murphy@arm.com>
 <542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com>
 <aK259PrpyxguQzdN@J2N7QTR9R3>
Content-Language: en-US
From: Thomas Richter <tmricht@linux.ibm.com>
Organization: IBM
In-Reply-To: <aK259PrpyxguQzdN@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMCBTYWx0ZWRfXx7bT3ieVYWZ1
 FvRIJn/6odyl76gPtjq2fdUI3+ddgoyBguazv17xAc0h1PWPsciO7Io1+yf38004HJX48EZKQe4
 jjqa2jsZ613Il7PEWWZLmHVXl0DVElauSgaXsW2jrn5unNTZZAgCkgP5ixkSnbssGkUA98RWoHK
 6CllyViFj8nmb4/kmZamtgDzlo/xirMdIPTqK1ytIy748E4TyQcONzfTAVM6cDoHbAMLdYuTHtD
 UT6EmBwE8Tz6Ajw1M3OeNTbMk21jMwITf/ouwlMB6Q/Hm12FuudC6E2iwfSIPWm8nU5cvD4JBmw
 ghpRUxLnbbdBrU5mCsCpBm2H2yjaVRWCqCxRNsBxe1xCwhV1Oev6PUoPQ5TLoGumXLZUFEfuXwo
 /BJHYr+T
X-Proofpoint-ORIG-GUID: Z1OBCqtS81HxjTSNcENNGRKeOQ0QzPO9
X-Proofpoint-GUID: 4pnWswYamnTcgbcPVqCp3LQWR1ph9h16
X-Authority-Analysis: v=2.4 cv=evffzppX c=1 sm=1 tr=0 ts=68ae972b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=7CQSdrXTAAAA:8 a=KByoUL483hSIROooWq4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230010
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

On 8/26/25 15:43, Mark Rutland wrote:
> On Wed, Aug 13, 2025 at 06:01:10PM +0100, Robin Murphy wrote:
>> Only a handful of CPU PMUs accept PERF_TYPE_{RAW,HARDWARE,HW_CACHE}
>> events without registering themselves as PERF_TYPE_RAW in the first
>> place. Add an explicit opt-in for these special cases, so that we can
>> make life easier for every other driver (and probably also speed up the
>> slow-path search) by having perf_try_init_event() do the basic type
>> checking to cover the majority of cases.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> 
> To bikeshed a little here, I'm not keen on the PERF_PMU_CAP_RAW_EVENTS
> name, because it's not clear what "RAW" really means, and people will
> definitely read that to mean something else.
> 
> Could we go with something like PERF_PMU_CAP_COMMON_CPU_EVENTS, to make
> it clear that this is about opting into CPU-PMU specific event types (of
> which PERF_TYPE_RAW is one of)?
> 
> Likewise, s/is_raw_pmu()/pmu_supports_common_cpu_events()/.
> 
>> ---
>>
>> A further possibility is to automatically add the cap to PERF_TYPE_RAW
>> PMUs in perf_pmu_register() to have a single point-of-use condition; I'm
>> undecided...
> 
> I reckon we don't need to automagically do that, but I reckon that
> is_raw_pmu()/pmu_supports_common_cpu_events() should only check the cap,
> and we don't read anything special into any of
> PERF_TYPE_{RAW,HARDWARE,HW_CACHE}.
> 
>> ---
>>  arch/s390/kernel/perf_cpum_cf.c    |  1 +
>>  arch/s390/kernel/perf_pai_crypto.c |  2 +-
>>  arch/s390/kernel/perf_pai_ext.c    |  2 +-
>>  arch/x86/events/core.c             |  2 +-
>>  drivers/perf/arm_pmu.c             |  1 +
>>  include/linux/perf_event.h         |  1 +
>>  kernel/events/core.c               | 15 +++++++++++++++
>>  7 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/s390/kernel/perf_cpum_cf.c b/arch/s390/kernel/perf_cpum_cf.c
>> index 1a94e0944bc5..782ab755ddd4 100644
>> --- a/arch/s390/kernel/perf_cpum_cf.c
>> +++ b/arch/s390/kernel/perf_cpum_cf.c
>> @@ -1054,6 +1054,7 @@ static void cpumf_pmu_del(struct perf_event *event, int flags)
>>  /* Performance monitoring unit for s390x */
>>  static struct pmu cpumf_pmu = {
>>  	.task_ctx_nr  = perf_sw_context,
>> +	.capabilities = PERF_PMU_CAP_RAW_EVENTS,
>>  	.pmu_enable   = cpumf_pmu_enable,
>>  	.pmu_disable  = cpumf_pmu_disable,
>>  	.event_init   = cpumf_pmu_event_init,
> 
> Tangential, but use of perf_sw_context here looks bogus.
> 

It might look strange, but it was done on purpose. For details see
commit 9254e70c4ef1 ("s390/cpum_cf: use perf software context for hardware counters")

Background was a WARN_ON() statement which fired, because several PMU device drivers
existed in parallel on s390x platform.
Not sure if this condition is still true after all these years...

-- 
Thomas Richter, Dept 3303, IBM s390 Linux Development, Boeblingen, Germany
--
IBM Deutschland Research & Development GmbH

Vorsitzender des Aufsichtsrats: Wolfgang Wendt

Geschäftsführung: David Faller

Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294
