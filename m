Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A960F7D9EBF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 19:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F85410E03D;
	Fri, 27 Oct 2023 17:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6029210E03D;
 Fri, 27 Oct 2023 17:19:14 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RDUsKK031151; Fri, 27 Oct 2023 17:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=lFC5remiqYM+jyvpTaLGFyyU0D0rO0bh9XFNQWtzlbQ=;
 b=2Y8Lgo6Y2x+LyfoDD9CPzlzm1szF3e8E35R/p8C2P0nrt7B50U9rPOj7+OIZmlj7h65w
 yLDQj9CL9c8RiR6/k2gtM9lCZS71kS1IPtUo5v8754T+W13gNGq5/ZUQiAvSK+TNV7WT
 e8/hPI7SzIoGfT78mapD89jPd4FHPsSeo3Fy/PDC+IqHjlbZpEl7H3MSn3fYN1rIanYQ
 HdKnWGmES+r7Bn3LH8iaeUdL3YJq3Ya7Nfub7q3TpuL/qDPVaWLM7NH9V17CgLMEyHms
 U2ksy3DkCqT7+f2nTREOmX7WoZmG4KxMML3p2VzGO9/vJVT8GdUjpR8sS0jGjrBv7mmF SA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tyxge1xmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Oct 2023 17:19:06 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 39RHIvfZ022869; Fri, 27 Oct 2023 17:18:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3tywqjr97e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Oct 2023 17:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGM0wqYzRG56+IpeO2+Dav4nES/nFjMULan6ldqCDv4ShQ/bD7pV13PeLR6oUN+D2zxM64eizpxXVvQjX/MtlMyVbsADDI0nEhyIMS8l/Avqjbp+PAnGDHhc4VUtfbC+Ss91iW+asQXupMVT8we+rFJ4OCnAugmQjKDoTO9HrjKO2ou3SLh3no8Wamf/avureOD/nd3+SSPsBdBbHauk0S7OxECkXaAplhXajeWZx5yzjri0N7LVa6H92BmMe1oSn8ryWOUyhauHmyepMR+Q3ylDdRA7ySrmrIPQ/jsq4LaVaG1mTelGeZFbj2ppSd7C0seTTtigvhAO1fhs1td9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFC5remiqYM+jyvpTaLGFyyU0D0rO0bh9XFNQWtzlbQ=;
 b=ZJl/uijug955KhXanGbNqCEIgrnPW+IcJllh873P4YwWyZRynnwdS9rz59aOFOlALzqzg5eEALkLkN8kUEEMHM/2fHqHzEhu81JB++sEJW4bnFBZ7WW3VoVGQJNdJTc72e2jXChdMGN30SyxeqnwyClV3zat0nmo0AegX4EMVPzVKC3D7/FxF6uKAmn59jkfxQ8WFotck/ZjOg3Bpxvmv6Lo/TmM+L2bcrjg2Q5MPScYhwHaqbZ2tltkqKZwPMFoTzw0SSacovgCXdnIhyay7o0fFEjqfOykx4Yj3NjQeXAItJqJT+2RGNKOqs0lY6p5AmoorLKDeLfbx145LDeDpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFC5remiqYM+jyvpTaLGFyyU0D0rO0bh9XFNQWtzlbQ=;
 b=FkMmUWzBRI7dldT+Z65j5t5Ld3kW9qOmmoH4Ya2lqo2h0FtMJj6+aO0mlJFiFiyP56huUzTJF6HJSF3bRVPKt12swLmYxCI0I3CBJgS3O7KLjcfi6XKp5n752Cx0yraRvPOJ43kBEAyI7wrc9oCDbs0/EMxs7eko86taw9F7b4c=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by PH7PR10MB5769.namprd10.prod.outlook.com (2603:10b6:510:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Fri, 27 Oct
 2023 17:18:56 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::7e79:4434:561d:fe1f]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::7e79:4434:561d:fe1f%5]) with mapi id 15.20.6907.025; Fri, 27 Oct 2023
 17:18:56 +0000
Message-ID: <f7562b7e-0a1c-46ea-aa72-236ada533558@oracle.com>
Date: Fri, 27 Oct 2023 22:48:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i915/perf: Fix NULL deref bugs with drm_dbg() calls
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231027140729.2505993-1-harshit.m.mogalapalli@oracle.com>
 <1e844f00-fc16-4788-8d90-ebe115eb9313@intel.com>
 <4d850f3c-c199-470f-b83e-00bd9fddbd7a@linux.intel.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <4d850f3c-c199-470f-b83e-00bd9fddbd7a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:404:56::31) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|PH7PR10MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: df8bb5b0-fb21-4694-a96b-08dbd710ccdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fnhD38OFPLONtDioRjjxd+soWo98MeJ+XIxOO/f6ok4R5bGvp865MITefwYaEsbqsfuMboFkdxkNs3Hx/xJQcN0PnEJdyV4o2vfGGhvhC2F+AmvulYU/Yi5bjOFQCb21D9eJdUreDf4RYp4iLB2fXjWpxazint45alKE67yAYVtFL85xP+JjEADv7BqnK9A5ajrKWZNRZmLz0ZBGp+VuhBTxyoEgraltSQ730MkZGlE9N0ov64GZdToLWb5tcNMLYGMiClJttndmNUsMy7XNGxMccUHxjSfk1ETocFWcAyEOe1A8H6vqvC4WArXlW6umaSHVmpUKCVQc5qv27lV4Bg34OYcLw7KOw6bqWsK/pyy+g1k+Tai6YVoBkNai1USFr2XI5Ntdks4EBgJOHDCtQZDMdPZc+QYW7w2AYyQJkZy/7ksyFN1ik2ZlQOCp/02EMeCXEBzytPF6yP/IxVmzsVLYZiHDuWA7rDO1GTjMp5sGvTl1Gz7R3cLKsJATHd9J3zaWNZ3SIlq0dameb7YK35frMSr/m4nAlfHCVr+vcrTS5G+KF708risZig8r4uxR+u6o6WGe2pC19oPiJlgeyK2i2IA/bQ8Rz1ntGmL+FzqUwWVZXmX1fOv9Ssk4H/LiFyQEp5faBaiKfjmvrgoDPYr0BKQ4TMsdKh4CnFKPXc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(478600001)(6512007)(6506007)(38100700002)(6666004)(83380400001)(53546011)(31686004)(6486002)(26005)(2616005)(5660300002)(110136005)(41300700001)(8676002)(8936002)(2906002)(316002)(66476007)(66946007)(31696002)(4326008)(66556008)(86362001)(36756003)(7416002)(921008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3V3M09sdXpJU3Z6blF6MmFoSFBGRitHL3gyMmxpMnB0Y1VrenloRys1SXps?=
 =?utf-8?B?aXZ6OVhhZmJzTDJXLzZrYVNsczhmdEErWlRmQkZPUzZ4bUhLeVF3M3VtY0Nq?=
 =?utf-8?B?U251UnlHdFVvVXc5bTZTU1VXWEY2VUlSNTZHMUYwU3o2RG9zTUVsRFhhcW8z?=
 =?utf-8?B?SmtpK3JzN3FSbUhiRnhKYlVQRHJBQzI1YkFNZEFhdDlxMzlsaHc2SHVQUkNZ?=
 =?utf-8?B?Z1hCVFhRWFJzUWl0eHdpcFRGQ2J0ZGRJS3pTcUlYS1dPb2xCMnNVcDBydnJq?=
 =?utf-8?B?V3JzVjNKZlJVbzdwTmpiWDhIcGJJM0l4ZU9oenVYTE9nYUVNRzh1ekRCNXRw?=
 =?utf-8?B?Y2c0QVMwZjlJTHNGK0tSckQwbEQ4ckIzTTNXN3BPLzhrY3FkVk5xWmZWUTY0?=
 =?utf-8?B?WXJJdnpNQlZjcXovS0lUT3JQaFdxY3ZHSjdhVVQ1cTEvR1RRSWtCcERWZDBv?=
 =?utf-8?B?a1g1QTV1aGNZdjRFeXlJZHRoZWROMWNkTFgvekxWZzFHNkxsSWU3ZGZzZ3B0?=
 =?utf-8?B?OFJGK3BvMDNVRGk1cXhvLzFWTWFJR1pvQzhxWkRtVmVtbmh3THZVMTNHbzlm?=
 =?utf-8?B?eENLanduS21SeGtjckl2SFBmbWxhVUZXT29TTFpwSXVPQWcxK3VjUG83L2RN?=
 =?utf-8?B?RjIxdnZsTk8xdHRiRWppMGpnU1BmUW9FWVo5K0JhQlc3aFk1UW11Uk1PTXBB?=
 =?utf-8?B?VURKVDg2Q05QLzUzRkEzMkdyRy9vTFhDUncrUFNTWk9sU0pmVkN3ZDV1bkFh?=
 =?utf-8?B?ckxSazhLbkp4NW5qWVBzNTA2N1prRmhheWJ6OEZrcXRwRERjWjhWdkhuTXMr?=
 =?utf-8?B?RUZUNU96NHliLzJaR3ZlcWRlZHBUYVcyR2V1U3V3Uk9uMVpVUVNHZjZFZVZQ?=
 =?utf-8?B?cjZnVlltVXV0WVFGa1VVN09ocWo0MksvNmRCZnhjbG5SWHlQWGkyeGdxQVZp?=
 =?utf-8?B?U3BzeUhoMjJyTTA5ZEw4MXdNNUVqWHZNVHNJQjZySGlWbU11YWhQSGh1eWl4?=
 =?utf-8?B?Mk9tK3JLbXNKMzlNcVBKQ0dNSVM0c1p6VGxRQ3M4aGdWM0YwR2hkUGpmYlVk?=
 =?utf-8?B?VmRlVUxaOHAwR0hDb2ExRTQxVnZLVHpQYWpsc0plMzhyWTBkb2I2bXIxa0J6?=
 =?utf-8?B?MitpZjJrS3FRS1RWU2g2djZnVXBvVDdIT28xZUJnUnFqUlM0VHplMWM4Zjhu?=
 =?utf-8?B?bFRBWFRsR0NaTHUxTUpZaGw1Skx4Zm41RFJRNWhweWpBUldycEJmeWsrRVNC?=
 =?utf-8?B?NEt4S3RaK0JUQ3FNN0ZPK2xxNTNoRkVqNkxRbHdHVndyTHRqYUZpOWpLb0VK?=
 =?utf-8?B?VUZRV2o1cDh3emtDeFdVcjFHdDBpOUhheDZ3K1k1cDFXZ2UvTUF3bHBuQjEv?=
 =?utf-8?B?MzZWUEtUYTRlOFA0d2NRdTEybmpZbFlIaklFTk5RQk9TcXVnU1BzR3FHYktF?=
 =?utf-8?B?WmNSWk9ld1A4MG9lbm1obVJ5aDROcExLald1Znc5VXpMWmo4WmQ2WjVKY01G?=
 =?utf-8?B?c053YTFVMnIxaVlpUHZLd2VhdTBkS0N1Mlh4MVpnT0ZnQ3VWRUJYODFqbXVD?=
 =?utf-8?B?QlJYRUlPdUN0V1BkY2RkS0JEMC8zMHhhVVA1YTVGOXRPeDdoK20zZEVkUTN2?=
 =?utf-8?B?bmJwQTRKam1pbzVIdnA5UmtUOVliZ2lFNE5sVzdpdWZaSmY2U2NiZVN6aERE?=
 =?utf-8?B?WEFkWlVYbHFKSEt6NUsxVS9QTWRLbWxOL0pNL3Ewd0dHenIwSTVCOXNqN2w2?=
 =?utf-8?B?eng0bGl1SCtKMGgrUVdrUTVabzk2aHU5ZFVLYmJTZytuUUFxU2tWRHp1L2hZ?=
 =?utf-8?B?OE01cTJsam9oSXFwQVp3MW52S3U0VzJ3NUFCUzZxMHdORS9iV3g3K3BXa2ph?=
 =?utf-8?B?M2Z4QXhsa2xlL1BnNUJRNUxyVlBDdCttcmhZSHFEMnkvOVlSMUFpMzREakNS?=
 =?utf-8?B?ZjJDZllYYjBYZGpDVlEwamZ6dDVmZVhVN1RtclIwQVpjcW1ickpHdWh5ZU56?=
 =?utf-8?B?dmdhUjVMZlRHenBHM0tzRDZXYXBsYU53MkxyalU2TkZDdnJNSXZYRWJxK2Z6?=
 =?utf-8?B?NGl6YWZkang3Z3l2WFlZc2pzS2FJRlViYmdGQUZhRmlxYXhsT0hKT3R0MXhF?=
 =?utf-8?B?TWZseWgxRTVab0p6MVNwYUxKSEt0RUxNSkRrZlc2WG5nVEFMSENES3VzTTNX?=
 =?utf-8?Q?YhaBLQNPimKqYfebtNjzYlg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?bmc4SW0zR0Jqb001ZmhLOWRKZ2VmUmtlZnJKVXBuUXIzSVJiNzZ5M2ZuUlFY?=
 =?utf-8?B?ZmZLWUsxWElPQlRPSFhuRFU2N0NtcnV0aGNtaStycnZnY0FHcWRyNllRd2Rn?=
 =?utf-8?B?NytxZ0gyT3BkdDJjZkZOUW01aXEwUGhyOEdjYUtiZ21Qa3FLV3NKV0V3UXR3?=
 =?utf-8?B?TUxIbUFXcnZvNUZYMStkU2hvR1RjTlRtUmh1MVlBU1hCbjQwcWhXSFQ5aEJz?=
 =?utf-8?B?WFJFWHNZSU5QM1VLaDBxbzh5akVSOHBNTUJvdTdoakl0bWRnRzNnZ0E3NmQ5?=
 =?utf-8?B?eUZyVHh2TzIycGY3TExrVjExbklKblZTOUkramlRK3dSVDV3cHdTYkxEWFdS?=
 =?utf-8?B?Y254d0dTRy9EL3FnQUJRT25UYm9KclE5ZXhjbTZ4Wk9ydVdnY0o2Rml0STVx?=
 =?utf-8?B?dGpMZG9xOWNIRlRnWmdqRWFJdmlqVStZbGFNZjYyV0FjR2pESW9lQmtqQVU2?=
 =?utf-8?B?aG9DcU9iN2pUTFR5NWpmRUJHU0RMeWwycDdzYTVjRExac05MaEY3aUEvYXly?=
 =?utf-8?B?eHQvY29ZeUk3MzNEalhUNzZpUEZOT3o4cVJUd01hZWc5QXIzUWMybVFXcmc2?=
 =?utf-8?B?U0xMLytYcEx3NmVhNE1sdkZhVHJmWUhpSnRHMm1kZmcvczdiSTRSaGh2R0t3?=
 =?utf-8?B?ZGNLNnY5L05zVVNIVGUzcGh4Q2pPSU5CREZOdUNlbGNkQTJ2TTBkR3k0R2ZI?=
 =?utf-8?B?R2tEWUppYTRyQ2ZrKzhxOGhkZ3kxRE5aN3lrQzc1RWVkaFkyTWJuZlc4dUs0?=
 =?utf-8?B?b3dOV0Y2S1RHMFB2NElQU25tTnNRR3RhZzllNE02UTVCeWFQaHE5ZGdzNmhl?=
 =?utf-8?B?V2FrVXBxWFBMcXMxTGFpMTV1TmpidU1mNjlKd0Y4UDhrdzFtbVNKYW1NSjda?=
 =?utf-8?B?dDFRRzh1ZndRaUFzcmZ2YURDZHlPd3doQ3pFeGtpSUo4dmdvS1BSYkYzZ2l0?=
 =?utf-8?B?eHNwWHVLUFVsUWtTenRyaURjUzVpQ21HWVJKd20xOHkvQUxDdTUxTjlCT0or?=
 =?utf-8?B?NnFIbGpmeDZtc0VETU4xREUyekJySmFZQklWa1B1VENJWXlUbmcvUUxFaURO?=
 =?utf-8?B?a05uVGh1L1lkZTdoRXRhKzZKYmptZHNPa3h1U0NhQ29DSnc5b0l6S2tOWThH?=
 =?utf-8?B?UGtaRzlYSFFvN29XY3VmbkVhckg5S21QeEhVbm9SeEVLSmEveTI3aWVYSVlj?=
 =?utf-8?B?c05sOEQ4VTIxdTQvZ0xxU3hNcWpmTWw1STM4NWJLTmQxRENmTWpHb2VQSDdu?=
 =?utf-8?B?S2xLaWx4bmFtSGE5ZmRJcnB4aFd6eWtkcGllSXdxMW1uSzk4TWhwRmFUU1VN?=
 =?utf-8?Q?V8yjeY3d4Mh18=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8bb5b0-fb21-4694-a96b-08dbd710ccdd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 17:18:56.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSR3XDbQho3CJdXNJ8wLwgE7AiM/JGz4K1slqYW+NkyH7M8/67+HCGqyi68nvHumiyOJzOGcKtYhpd8DSVJSLiHbAn3EuN4PcYZBm+1uS+0UwRCvsle1pA5lybYAspnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5769
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_16,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310270150
X-Proofpoint-GUID: vnIva8HU1HbtqSe934N7E7AMQ5--Eaxp
X-Proofpoint-ORIG-GUID: vnIva8HU1HbtqSe934N7E7AMQ5--Eaxp
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
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
 dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On 27/10/23 8:17 pm, Tvrtko Ursulin wrote:
> 
> On 27/10/2023 15:11, Andrzej Hajda wrote:
>> On 27.10.2023 16:07, Harshit Mogalapalli wrote:
>>> When i915 perf interface is not available dereferencing it will lead to
>>> NULL dereferences.
>>>
>>> Fix this by using DRM_DEBUG() which the scenario before the commit in
>>> the Fixes tag.
>>>
>>> Fixes: 2fec539112e8 ("i915/perf: Replace DRM_DEBUG with driver 
>>> specific drm_dbg call")
>>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>>
>>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Please hold off merging.
> 
>>> ---
>>> This is found using smatch(static analysis tool), only compile tested.
>>> ---
>>>   drivers/gpu/drm/i915/i915_perf.c | 9 +++------
>>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>>> b/drivers/gpu/drm/i915/i915_perf.c
>>> index 2f3ecd7d4804..bb48c96b7950 100644
>>> --- a/drivers/gpu/drm/i915/i915_perf.c
>>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>>> @@ -4228,8 +4228,7 @@ int i915_perf_open_ioctl(struct drm_device 
>>> *dev, void *data,
>>>       int ret;
>>>       if (!perf->i915) {
>>> -        drm_dbg(&perf->i915->drm,
>>> -            "i915 perf interface not available for this system\n");
>>> +        DRM_DEBUG("i915 perf interface not available for this 
>>> system\n");
> 
> What's that struct drm_device *dev function argument a few lines up? :)
> 
> Although TBH all these these could just be removed since I doubt they 
> are adding any value and ENOTSUPP is pretty clear.
> 

Thanks for checking. I will remove the dbg() calls and send a V2.

Regards,
Harshit

> Regards,
> 
> Tvrtko
> 
>>>           return -ENOTSUPP;
>>>       }
>>> @@ -4608,8 +4607,7 @@ int i915_perf_add_config_ioctl(struct 
>>> drm_device *dev, void *data,
>>>       int err, id;
>>>       if (!perf->i915) {
>>> -        drm_dbg(&perf->i915->drm,
>>> -            "i915 perf interface not available for this system\n");
>>> +        DRM_DEBUG("i915 perf interface not available for this 
>>> system\n");
>>>           return -ENOTSUPP;
>>>       }
>>> @@ -4774,8 +4772,7 @@ int i915_perf_remove_config_ioctl(struct 
>>> drm_device *dev, void *data,
>>>       int ret;
>>>       if (!perf->i915) {
>>> -        drm_dbg(&perf->i915->drm,
>>> -            "i915 perf interface not available for this system\n");
>>> +        DRM_DEBUG("i915 perf interface not available for this 
>>> system\n");
>>>           return -ENOTSUPP;
>>>       }
>>

