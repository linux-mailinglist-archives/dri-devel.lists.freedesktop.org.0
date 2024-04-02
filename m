Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916F89557E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 15:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255910F691;
	Tue,  2 Apr 2024 13:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p3cQeOr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2105.outbound.protection.outlook.com [40.107.94.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFE410F691
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 13:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9YK0SN/DMoV+EdPjdN0huoPZUiNItAhVUSigsgWCT34ax3Q9Akxumezi/AtKWMtHuWqlQiVnEkPHk2D1px7dGjj0r98ZrUpyTsS+BZ2TjsLL3kujK7t+2HzrbSygwSceGengZapXAWGLMQd4JQl0Ufu//ywkPNxOojk6/5owgJ7hh0mJhmjVfmM0clbXIHFgM2QTx9QjMmesAkAwcCjAOj57tCMiWUdxFq1tEWkmjcC297KBeSSxPU3Ef7Bv27Ysszo5CDJQzxHgavMG5cbdEOXT8ZeXk8bumrxq5WsTpEU1rD4Io4Nz9+kM17nDi9iorCTaLlsM1iRMwQu0kSYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hRjJw/Ff9aUhHx7ZYHV2K9FsLC1Ug33l+fXKyG+Li4=;
 b=QDuAvsy/fvtg6iUNeyfnHi8A7TrJDWkaIgPdZWdTPR+jaO7zOGY+70ci2xk495eG97zpevVByFkxa8LcMnxFDnMQIeBowktdwdd+rSp6I3p5xR/HxyFwKvjT7bCrmTpfwpJJldA0ITVR/5jw2yXjvtwQdutfesY77AWSvMq0LaeYScXYi3/tAZUl4bALTfKZecfucXukHo0tWfzBZtbYwx7eIkfOootxf0gr0N44zG2fhY4Qp6b1NnuWdEs1AqMQrhPHF/qKJ+QlO7Uo15G/O6NAq8sHdVBB4wKYOh6ui8zfAopEt3eoJvl4LjhA4Zd19s1EL1oV8Y9IugSKQryi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hRjJw/Ff9aUhHx7ZYHV2K9FsLC1Ug33l+fXKyG+Li4=;
 b=p3cQeOr7ANVy9+WNwczG3FKPcZYNexfGn9U7h174OhRr0pW6cv0qMZiLNT+Za22ce0zYQCdS05WKDNsBafD5O6uxTlKglgXXZ+wN4+n7L5paFe19VbSqmKRl29hNampVN1edldKRrXJsPNDmgLf+OFYcc2VC4Gu+lggs8sQPDN4=
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 13:35:54 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 13:35:54 +0000
Message-ID: <ebbf7cca-f3e3-66b5-9e35-62b839c08949@amd.com>
Date: Tue, 2 Apr 2024 19:05:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 0/9] Improve test coverage of TTM
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <cover.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::18) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|PH0PR12MB7792:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 89/oa4Iyj21CaQSYM+sy6O30F5ko0DRlQknEy/sg3lKaFeofgvjyxqDVU3O2CHMfif+5vSPE7Ob5czaKaX6/S+Jxjn3WpOGFMeALmKz8PZ8L5Eai/rw1l8gGse22uzArmfcCNeleofObnEvelHkfDrUMYDX4zKenRL4JtiuLoIyCNLi22ytYj5MrnPwMFatnUbpY+HmUQ1Gq9IQl/NGruvXUZ7qUkGeeQShZlAivrGhY+4+TJkYhnOpj5S9X6TikvlxQMyisIoTGICWGThfLPkkQcrBKrHAZl/dJ5M/VsKwFu0A8rN1hB9AaNUJdBWm0hFFCZ+H/lFQjRTsZy0TBkjf47rIoVSzwM5R0DkfMuNMjTr6YyJ+vQHauciPEVKZ2hyLLPJuvxpcQzu+0YDHyZ8AWFIZ0/uSkna6hZIwPaNoiAlHlvhlnlFBqN9yHYum0FGlx6JeMb8+Z7NKauRQ/ToAC7RW3aMtJznmNxavJeglzR9VHHwmyBnNsI3UKEmdsw+/fdwLrbXXQLMi4dEbemPTiIXxijIF+R+aLXeFV5fjRiiYNz76+RrVKI74tG36NVo0NUK026GdBm7yiWOv/RRTy3fDmXzfuIVJZ0BPiAloIwwwx0Y/VCQZAqjhhOwh4V7piUVrbEeKDObwZ6x2N+ZI3LSY0NdorfETI5Zbr22E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnVGTGxiY2VpbUlUZkd5QTJGWXFwMENDemU4RkJUQUREU3lCbWQzVDF5TjdT?=
 =?utf-8?B?UW1IbTNqTVZsRGNDSC9HVDRKME9MWDNMUS9IcG9BS2cvS1kvaVFSUGdKWDB0?=
 =?utf-8?B?QnB3ZGFQM21FVmk5SDFWbnU1MU5yei9sNGxJVjZSQUZBMUliaHNyYW51UG12?=
 =?utf-8?B?MzdWRkxCS3NIT1hSTkMvU0hjVEhjVnVLRDA0OTU1QXNGNVIyVExUeWpQdDlE?=
 =?utf-8?B?OFgxMXdaYmtvclNpL0J4c1JBdHpmOTV0NHV1Y2JZRk5UMnBsMTBtQ3pRVmFr?=
 =?utf-8?B?YmR4RkFGTDN6R0ErcGtHeXErcHVpNmhDaEt2azkvSnFNYnBDT3NaU1VkVFF4?=
 =?utf-8?B?QUFMTERxbmh3bzZxZWVuMmNQY01uOFUxSVF4NlhIWm9OZit5bkxKWGN3Tmk5?=
 =?utf-8?B?QXltYmYzNlI0aTNvdmFINGY3ZDUwWUgvQjdaaWtORjZWeU5XWDBLZjV0Nmc4?=
 =?utf-8?B?ckREYVMvRkQ3VkppSmMyT1ppQmMyQldISGNMMW1BNWV0UkZ3SW54ZEE1eXpN?=
 =?utf-8?B?UVJHdjFtYmZEUTFKS096enJDYTh2WTd0cysxUVNkOXkxRHN2b00xU0lSV241?=
 =?utf-8?B?RUNzMm5ydHNHbGRKNktRMUxxb3dNZGZNZnRld0NWTlMveThibkFlVm5IMDYv?=
 =?utf-8?B?cCtvampES1ljWFBWSWxzSDlOQ0ltM0pMMmVKeHJURDZNODJnaDFjbHdLYWV4?=
 =?utf-8?B?YVdEWFJRUlRaOVo0bHhHYW5kaWhOZVlyd01ZZjh6VDNlRCtZMGd4L2V1NUY4?=
 =?utf-8?B?QlhuWEpEWi9RdGFtWnhBV25ZczJvb21OdlE4Ylc0bnErSEdlV0JRWGJsUU9x?=
 =?utf-8?B?ZExGdDFkNVR2eUVtYk0ycHZNY0MrbHU4cE5sQlZNL1hVcnJXc09JVHM5Tlc2?=
 =?utf-8?B?Z2k3ZG81cURvV2FhdXlKYllzcUljL2xWN3JHakRISEpOVW9QOVRFSW82SlJW?=
 =?utf-8?B?ems0V2lMNnJLT1hGNU9kOHd2ci9sYVpmeGxYN1pCWU5Nb3Avbk5VamhWQm9y?=
 =?utf-8?B?aytGZkdQVm1XaTVoYzlCNjc5eVB2QzFCQ2hoSEkvT1gySTNQYlJSUFIxbGVs?=
 =?utf-8?B?YnZmQnQ2WGNsVEJ0ZXVjZk1JY3ZhT0t4V0JqUDBCWmVtdmJjTndnWXpIVDkv?=
 =?utf-8?B?Z2RNdzNiaXZocERFRGVkUkJpUUQzVVlwQU41dW8rSnB4cFlmdjF0NUFEL05m?=
 =?utf-8?B?YzhFVHdEeGgvaWFBYXNBSktyQ2hZS0dON3ZpNERmOHB5OWo0ZkZSM2x5bXRa?=
 =?utf-8?B?NHVFdHROM0k0dEFsZUhTVEgwQ3FnSjV5S0NSeXltR3VYWUh0QXdJYlBmTWNG?=
 =?utf-8?B?SzhLdFFrdmtONVhlU3NvMWVRSHMvZHpkV2xrQWFRTzNyUXAvOWh0K0p3cGRL?=
 =?utf-8?B?V3I0dUE0YVMwMEFsNzZhRzlNdnRCMTZNdm5PV3FOYk1yRmcyOGJqblNVTnhF?=
 =?utf-8?B?Ti81a3pNY29pSzk0WW9tT1NMQ0JPRS9xZmI3R1h2QnVxTHdDcUxycExDVVlu?=
 =?utf-8?B?WlJ3bjhvZFJjcSs3Uml5M2ZmNzU0R25TZjRFaHdoNE9tdHBURlNzeVVUUGpM?=
 =?utf-8?B?RUNMUU0zdVFZYmJOczVlRXh4S0pTRk9UVGpwamdzVStyWXp5V3p5NElKOG9t?=
 =?utf-8?B?aUk0SlZpVnBQMTI5UURZaVpRMDRZaisvZEpZQy9JS0VlWWRJcmdPZ3ZkOTU0?=
 =?utf-8?B?R0taYWdlaXJsWmVGV3Z6ajZtanlzb1dVMktLMDZiL0tGQ1BFRUFFcDBWeHhq?=
 =?utf-8?B?cVdIVHhzT0lFdkw3WWprakdQQ0xVVDJXTzZFMEc0b2dJNEErUWc5dWV2dmVh?=
 =?utf-8?B?dmtpU0hWQUlkSTNGK0d0c1llQWc4MjE1TWY0WEpCcTJKeVQvR2NGcUM4QW1V?=
 =?utf-8?B?ajNqbGpDVkFsQjdFNkNFc1lTc0MzbDlEZG0wbjQvckhRYndpS1Mzc3JMQjcv?=
 =?utf-8?B?cld2aDlodWQ0V1dzcWdJdGwxa3E3czUzMWw3cUpucWwxVVZGNzE4Y01jUlhs?=
 =?utf-8?B?QTV0di95azFvVlBYZXI2WjRFcVVQdWxuWWs2bHA3N3puNjBiVEo4SnZ3VVN5?=
 =?utf-8?B?dkZyUFp4N0JNZndLdHRodlpWRzdaaFVmclpkMUlTRVlnMUV5K0pQQkR6M2dx?=
 =?utf-8?Q?x5BiNIqE/1FH56pxL/Dmo1Yg3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6019f7b0-4758-4846-d8b1-08dc5319d1be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:35:54.0521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3m1MF6utLE568onrVBYDahenJrWGuXWDCeJetMO0807q5aEHfSRA7eGrsHxu5nJaOR9G12kBApD3WV28kx0zLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792
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

some issue with the latest drm-misc:  (commit 
4c4f33be7e4d476566246e7166c54ef175287e00 (origin/for-linux-next, 
origin/drm-misc-next, origin/HEAD))

Regards,
S.Amarnath

$ make ARCH=um O=.kunit --jobs=16
ERROR:root:../arch/x86/um/user-offsets.c:17:6: warning: no previous 
prototype for ‘foo’ [-Wmissing-prototypes]
    17 | void foo(void)
       |      ^~~
In file included from ../arch/um/kernel/asm-offsets.c:1:
../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous 
prototype for ‘foo’ [-Wmissing-prototypes]
     9 | void foo(void)
       |      ^~~
../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous 
prototype for ‘get_thread_reg’ [-Wmissing-prototypes]
   146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
       |               ^~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:16:5: warning: no previous prototype for 
‘__vdso_clock_gettime’ [-Wmissing-prototypes]
    16 | int __vdso_clock_gettime(clockid_t clock, struct 
__kernel_old_timespec *ts)
       |     ^~~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:30:5: warning: no previous prototype for 
‘__vdso_gettimeofday’ [-Wmissing-prototypes]
    30 | int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct 
timezone *tz)
       |     ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:44:21: warning: no previous prototype for 
‘__vdso_time’ [-Wmissing-prototypes]
    44 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
       |                     ^~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:57:1: warning: no previous prototype for 
‘__vdso_getcpu’ [-Wmissing-prototypes]
    57 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct 
getcpu_cache *unused)
       | ^~~~~~~~~~~~~
../arch/x86/um/bugs_64.c:9:6: warning: no previous prototype for 
‘arch_check_bugs’ [-Wmissing-prototypes]
     9 | void arch_check_bugs(void)
       |      ^~~~~~~~~~~~~~~
../arch/x86/um/bugs_64.c:13:6: warning: no previous prototype for 
‘arch_examine_signal’ [-Wmissing-prototypes]
    13 | void arch_examine_signal(int sig, struct uml_pt_regs *regs)
       |      ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype 
for ‘get_regs_from_mc’ [-Wmissing-prototypes]
     7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
       |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype 
for ‘wait_stub_done’ [-Wmissing-prototypes]
   107 | void wait_stub_done(int pid)
       |      ^~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype 
for ‘__switch_mm’ [-Wmissing-prototypes]
   683 | void __switch_mm(struct mm_id *mm_idp)
       |      ^~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for 
‘init_new_context’ [-Wmissing-prototypes]
    17 | int init_new_context(struct task_struct *task, struct mm_struct 
*mm)
       |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for 
‘destroy_context’ [-Wmissing-prototypes]
    60 | void destroy_context(struct mm_struct *mm)
       |      ^~~~~~~~~~~~~~~
../arch/x86/um/fault.c:18:5: warning: no previous prototype for 
‘arch_fixup’ [-Wmissing-prototypes]
    18 | int arch_fixup(unsigned long address, struct uml_pt_regs *regs)
       |     ^~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype 
for ‘start_uml’ [-Wmissing-prototypes]
    36 | int __init start_uml(void)
       |            ^~~~~~~~~
../arch/um/os-Linux/main.c:187:7: warning: no previous prototype for 
‘__wrap_malloc’ [-Wmissing-prototypes]
   187 | void *__wrap_malloc(int size)
       |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:208:7: warning: no previous prototype for 
‘__wrap_calloc’ [-Wmissing-prototypes]
   208 | void *__wrap_calloc(int n, int size)
       |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:222:6: warning: no previous prototype for 
‘__wrap_free’ [-Wmissing-prototypes]
   222 | void __wrap_free(void *ptr)
       |      ^~~~~~~~~~~
../arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for 
‘kasan_map_memory’ [-Wmissing-prototypes]
    28 | void kasan_map_memory(void *start, size_t len)
       |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for 
‘check_tmpexec’ [-Wmissing-prototypes]
   212 | void __init check_tmpexec(void)
       |             ^~~~~~~~~~~~~
../arch/um/os-Linux/signal.c:75:6: warning: no previous prototype for 
‘sig_handler’ [-Wmissing-prototypes]
    75 | void sig_handler(int sig, struct siginfo *si, mcontext_t *mc)
       |      ^~~~~~~~~~~
../arch/um/os-Linux/signal.c:111:6: warning: no previous prototype for 
‘timer_alarm_handler’ [-Wmissing-prototypes]
   111 | void timer_alarm_handler(int sig, struct siginfo *unused_si, 
mcontext_t *mc)
       |      ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for 
‘poke_user’ [-Wmissing-prototypes]
   111 | int poke_user(struct task_struct *child, long addr, long data)
       |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for 
‘peek_user’ [-Wmissing-prototypes]
   171 | int peek_user(struct task_struct *child, long addr, long data)
       |     ^~~~~~~~~
../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype 
for ‘parse_iomem’ [-Wmissing-prototypes]
   301 | int __init parse_iomem(char *str, int *add)
       |            ^~~~~~~~~~~
../arch/x86/um/signal.c:560:6: warning: no previous prototype for 
‘sys_rt_sigreturn’ [-Wmissing-prototypes]
   560 | long sys_rt_sigreturn(void)
       |      ^~~~~~~~~~~~~~~~
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for 
‘arch_switch_to’ [-Wmissing-prototypes]
    48 | void arch_switch_to(struct task_struct *to)
       |      ^~~~~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for 
‘pgd_alloc’ [-Wmissing-prototypes]
   202 | pgd_t *pgd_alloc(struct mm_struct *mm)
       |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for 
‘uml_kmalloc’ [-Wmissing-prototypes]
   215 | void *uml_kmalloc(int size, int flags)
       |       ^~~~~~~~~~~
../arch/um/kernel/process.c:51:5: warning: no previous prototype for 
‘pid_to_processor_id’ [-Wmissing-prototypes]
    51 | int pid_to_processor_id(int pid)
       |     ^~~~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:87:7: warning: no previous prototype for 
‘__switch_to’ [-Wmissing-prototypes]
    87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
       |       ^~~~~~~~~~~
../arch/um/kernel/process.c:140:6: warning: no previous prototype for 
‘fork_handler’ [-Wmissing-prototypes]
   140 | void fork_handler(void)
       |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:217:6: warning: no previous prototype for 
‘arch_cpu_idle’ [-Wmissing-prototypes]
   217 | void arch_cpu_idle(void)
       |      ^~~~~~~~~~~~~
../arch/um/kernel/process.c:253:5: warning: no previous prototype for 
‘copy_to_user_proc’ [-Wmissing-prototypes]
   253 | int copy_to_user_proc(void __user *to, void *from, int size)
       |     ^~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:263:5: warning: no previous prototype for 
‘clear_user_proc’ [-Wmissing-prototypes]
   263 | int clear_user_proc(void __user *buf, int size)
       |     ^~~~~~~~~~~~~~~
../arch/um/kernel/process.c:271:6: warning: no previous prototype for 
‘set_using_sysemu’ [-Wmissing-prototypes]
   271 | void set_using_sysemu(int value)
       |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:278:5: warning: no previous prototype for 
‘get_using_sysemu’ [-Wmissing-prototypes]
   278 | int get_using_sysemu(void)
       |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:316:12: warning: no previous prototype for 
‘make_proc_sysemu’ [-Wmissing-prototypes]
   316 | int __init make_proc_sysemu(void)
       |            ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:348:15: warning: no previous prototype for 
‘arch_align_stack’ [-Wmissing-prototypes]
   348 | unsigned long arch_align_stack(unsigned long sp)
       |               ^~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for 
‘machine_restart’ [-Wmissing-prototypes]
    45 | void machine_restart(char * __unused)
       |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for 
‘machine_power_off’ [-Wmissing-prototypes]
    51 | void machine_power_off(void)
       |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for 
‘machine_halt’ [-Wmissing-prototypes]
    57 | void machine_halt(void)
       |      ^~~~~~~~~~~~
../arch/um/kernel/tlb.c:579:6: warning: no previous prototype for 
‘flush_tlb_mm_range’ [-Wmissing-prototypes]
   579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
       |      ^~~~~~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:594:6: warning: no previous prototype for 
‘force_flush_all’ [-Wmissing-prototypes]
   594 | void force_flush_all(void)
       |      ^~~~~~~~~~~~~~~
../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for 
‘read_initrd’ [-Wmissing-prototypes]
   408 | int __init __weak read_initrd(void)
       |                   ^~~~~~~~~~~
../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for 
‘text_poke’ [-Wmissing-prototypes]
   461 | void *text_poke(void *addr, const void *opcode, size_t len)
       |       ^~~~~~~~~
../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for 
‘text_poke_sync’ [-Wmissing-prototypes]
   473 | void text_poke_sync(void)
       |      ^~~~~~~~~~~~~~
../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for 
‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
    60 | int __init kmsg_dumper_stdout_init(void)
       |            ^~~~~~~~~~~~~~~~~~~~~~~
../lib/iomap.c:156:5: warning: no previous prototype for 
‘ioread64_lo_hi’ [-Wmissing-prototypes]
   156 | u64 ioread64_lo_hi(const void __iomem *addr)
       |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for 
‘ioread64_hi_lo’ [-Wmissing-prototypes]
   163 | u64 ioread64_hi_lo(const void __iomem *addr)
       |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for 
‘ioread64be_lo_hi’ [-Wmissing-prototypes]
   170 | u64 ioread64be_lo_hi(const void __iomem *addr)
       |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for 
‘ioread64be_hi_lo’ [-Wmissing-prototypes]
   178 | u64 ioread64be_hi_lo(const void __iomem *addr)
       |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for 
‘iowrite64_lo_hi’ [-Wmissing-prototypes]
   264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
       |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for 
‘iowrite64_hi_lo’ [-Wmissing-prototypes]
   272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
       |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for 
‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
   280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
       |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for 
‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
   288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
       |      ^~~~~~~~~~~~~~~~~
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xa0): 
undefined reference to `drm_atomic_helper_crtc_reset'
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xf0): 
undefined reference to `drm_atomic_helper_crtc_duplicate_state'
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xf8): 
undefined reference to `drm_atomic_helper_crtc_destroy_state'
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x1f8): 
undefined reference to `drm_atomic_helper_plane_reset'
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x208): 
undefined reference to `drm_atomic_helper_plane_duplicate_state'
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x210): 
undefined reference to `drm_atomic_helper_plane_destroy_state'
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x300): 
undefined reference to `drm_atomic_helper_check'
/usr/bin/ld: drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x308): 
undefined reference to `drm_atomic_helper_commit'
/usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
`drm_dp_mst_duplicate_state':
drm_dp_mst_topology.c:(.text+0x3164): undefined reference to 
`__drm_atomic_helper_private_obj_duplicate_state'
/usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
`drm_dp_delayed_destroy_work':
drm_dp_mst_topology.c:(.text+0x39d6): undefined reference to 
`drm_kms_helper_hotplug_event'
/usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
`drm_dp_mst_up_req_work':
drm_dp_mst_topology.c:(.text+0x930d): undefined reference to 
`drm_kms_helper_hotplug_event'
/usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in function 
`drm_dp_mst_link_probe_work':
drm_dp_mst_topology.c:(.text+0xacda): undefined reference to 
`drm_kms_helper_hotplug_event'
collect2: error: ld returned 1 exit status
make[3]: *** [../scripts/Makefile.vmlinux:37: vmlinux] Error 1
make[2]: *** [/home/rtg/amar/git/drm-misc/Makefile:1162: vmlinux] Error 2
make[1]: *** [/home/rtg/amar/git/drm-misc/Makefile:240: __sub-make] Error 2
make: *** [Makefile:240: __sub-make] Error 2

rtg@rtg-prash-navi22:~/amar/git/drm-misc$

On 3/22/2024 7:59 PM, Karolina Stolarek wrote:
> Introduce tests for ttm_bo_validate()/ttm_bo_init_validate() that exercise
> simple BO placement as well as eviction (including the case where the evict
> domain also requires eviction to fit the incoming buffer). Prepare KUnit
> helpers to handle such scenarios and add a mock VRAM manager. This series also
> includes some updates to the helpers and more definitions used to define
> "special" memory domains (e.g., one that can't allocate resources or is busy),
> as well as drive-by fixes for the tests.
>
> There are a couple of areas in which this test suite can be improved.
> Suggestions for future work can be found in the TODO file.
>
> Use kunit_tool script to manually run all the tests:
>
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/ttm/tests
>
> To build a kernel with TTM KUnit tests, use a UML configuration,
> enable CONFIG_KUNIT, and then select CONFIG_DRM_TTM_KUNIT_TEST.
>
> Many thanks,
> Karolina
>
> v10:
>    Many things have happened over the course of three months, so the series
>    had to be slightly reworked and expanded to accommodate these changes:
>     - Set DMA coherent mapping mask in the KUnit device so ttm_pool_alloc
>       tests can be executed
>     - Update ttm_bo_validate_invalid_placement() test case to check against
>       the right return error. It's no longer -EINVAL (which only is returned
>       for pinned buffers), but -ENOMEM. The behaviour has changed in
>       commit cc941c70df39 ("drm/ttm: improve idle/busy handling v5")
>     - Rework ttm_placement_kunit_init() to accept only one array of places
>       and update the tests that use that helper
>     - Set fallback flags in eviction domains defined in TTM KUnit helpers
>     - Fix a warning raised by ttm_bo_unreserve_bulk() test case
>     - Scrap all r-bs and tested-by, as many things were updated and should
>       be checked again
>
> v9:
>   - Drop tests with basic test cases, they are merged now
>   - Add three final patches -- tests for ttm_tt_(un)populate, eviction testing
>     and a TODO file, with suggestions on how to improve these tests
>   - Delete the initialization of spinlock in
>     ttm_bo_validate_move_fence_signaled(), it not used at all (Andi)
>   - Just return the error code threaded_fence_signal(), don't save it to a
>     local variable (Andi)
>   - Use ttm_bo_unreserve() in tests checking different move fence states (Andi)
>
> v8:
>   - Add Tested-by tags to commits that introduce tests
>   - Improve the comment for ttm_bo_reserve_deadlock() subtest (Andi)
>   - Actually clean up the resource when "error_free_blocks" is hit in
>     ttm_mock_manager_alloc(). Without that change, we hit
>     DEBUG_LOCKS_WARN_ON(lock->magic != lock) warning when cleaning up
>     the resource manager because we try clean up an incomplete, orphaned
>     resource. That's not good, and this could bite us back in the future.
>
> Karolina Stolarek (9):
>    drm/ttm/tests: Set DMA mask in KUnit device
>    drm/ttm/tests: Use an init function from the helpers lib
>    drm/ttm/tests: Test simple BO creation and validation
>    drm/ttm/tests: Add tests with mock resource managers
>    drm/ttm/tests: Add test cases dependent on fence signaling
>    drm/ttm/tests: Add eviction testing
>    drm/ttm/tests: Add tests for ttm_tt_populate
>    drm/ttm/tests: Add TODO file
>    drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk
>
>   drivers/gpu/drm/Kconfig                       |    1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |    1 +
>   drivers/gpu/drm/ttm/tests/Makefile            |    2 +
>   drivers/gpu/drm/ttm/tests/TODO                |   24 +
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |    3 +
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 1213 +++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  173 ++-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   11 +
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |  235 ++++
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |   33 +
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       |  134 +-
>   drivers/gpu/drm/ttm/ttm_tt.c                  |    3 +
>   12 files changed, 1810 insertions(+), 23 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/TODO
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>
