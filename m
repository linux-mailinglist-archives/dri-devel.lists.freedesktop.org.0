Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D036C2116
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D39810E301;
	Mon, 20 Mar 2023 19:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9475B10E2A9;
 Mon, 20 Mar 2023 19:17:06 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KHmseo028126; Mon, 20 Mar 2023 19:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=DnHCik9QPimSv0oe4DF20OoWpLpXnMOnJKBc7ddgIbM=;
 b=Din5rvM4/aNVTS857Hsu1WsDCo4VcYTpfSgANVfnptpeOUcCZPE8tf8jjfeEEdQjSfP4
 PRO2lRuB6DcMIh2lRZTmTG8uPRQDaWXaAnY19liEe9Wolwe1lB/fL7kJvfctS2qOm9Xz
 Z/mYo3c8DAEN7NoRR2km0BwUvB0zzKarNbEkt7kAU2UdAEqJakBdV2k9UWlmRnUHs9I4
 ylFAXXbQhaUj8eCjUMTqmtHEokPzdJe5eRlowpoZz0AZD7UYMfJQeYiphbXPBXsk3+Vx
 j63pE4YVN5+JVOXq7ZEx70a/b1csCZXmjxCvJezmYRhZeLgkHEUT/cE66n3SDy8fpoyI yg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pd4wt4br8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Mar 2023 19:16:40 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32KIZ3aM015384; Mon, 20 Mar 2023 19:16:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pd3r57pmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Mar 2023 19:16:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBIc8PdMedY/IpQE7trYwmDQFijybyB+DNvb7b8OheeuhdkqSctkiVU3FTOKX47Ycu9nJIMeVpVgUCnMUPg5UyiRL+TBpwHzRA6QnrLMhibuqF/Kx35+BY00KsQaBn0Y+16M0bsYxpqiJVOp8jvbzz6JXLJR5FSIinLUGCRV+jilbPDnoCWt0oa3xJHCb/sLOGM49MbhEEK3j7Ti0abs9OU+5u4MlAJIuPWsnGVzgBbKpSgxnZxW5cCP9x0UN/o6QzIaPflwFMsH/ov/OTLaOAmXWyDSzOHiTmCNP/qPk3wg5s3FjNo3F75mInqQnzHMwnm0EjEsbbxWvef6Q5lHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnHCik9QPimSv0oe4DF20OoWpLpXnMOnJKBc7ddgIbM=;
 b=QX1BpdyH6rcqll5k3F/4XOhnNgt7NpCPl+nub/W+rpdP+od8bOd9JUtee7d0rKEnMYM4cP9t3xJqFvOc5pv2FYj0irZk4ynZ5eg5br/ZWfYXTJd/C4OUZZ0a6HMancnbvMTgebOhn31DXFHfFc23W0bI7JzwThvh+vEFkH4mBqZtFuQFbIJVzuMwb2RKV6Lc1EicUl1OmYIanuZICGbCXTStHjV8HpoTJgMtnBLcjH67G7417vHUWkaFk/hEL3dEytAbRCs3l+nsfnRDK+a8FNYQ2iOvN4fhQUhhlLIRqUlw7p6KL3A/PWnavWAuMdVq/Q4TQjF9qg5zdhkB+nSTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnHCik9QPimSv0oe4DF20OoWpLpXnMOnJKBc7ddgIbM=;
 b=QddeP/z9nGCo9HtMt/Uh8axXhKR3UiaSIlvb8zRsJF+OmCOeRADlGc/2DN2J6fRRcGcOMxIbHHvhAA7Shlcg2GqWAEe3EWq1sIftuYEIzqV/QWNax0rR3K6fpSC1FIs7W7CYQFmXeRlw425kRC/qSdLvOnpqXdURD7hRocJvHHo=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DM4PR10MB6864.namprd10.prod.outlook.com (2603:10b6:8:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 19:16:33 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 19:16:37 +0000
Date: Mon, 20 Mar 2023 15:16:33 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230320191633.wf3qdjtpy3xxtyz7@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
 <ce3ee7f2-e8a3-80eb-9bca-cd465f7f332e@redhat.com>
 <20230223190941.bkkloowmvqjiu6d7@revolver>
 <0868bbeb-11b4-b832-a601-f289278e3e76@redhat.com>
 <20230302023829.kcxyukt7guacr7xg@revolver>
 <87be9261-1206-75db-6aeb-27abe6e05821@redhat.com>
 <20230307224312.a4kxlykzlzkrcmpf@revolver>
 <06d30f61-4e85-5897-dba1-3a4ef462866a@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06d30f61-4e85-5897-dba1-3a4ef462866a@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::19) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|DM4PR10MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a2e8eb-ab9d-49bf-f81e-08db2977a040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o3fPrhjx4qr8IoZygJ+bjj2Hi77mplLcq82hQED8DG3jAsMQ3cJBjgjAZryHUKnr+bHpIfdDQxLG3MwwhLKz2L+Phm6zp4PAinWu98hz9VjP2w1FxbndWLPNhnKRg5x/k47heiqbKhOf2dtzAf4ekVMdZCLHb1LRqTcDxrp6hHkUuJZiEb/y+AN6d0yp3wpPv44rXcQS3KlBpMkp6nojRiIqVb053G4n3KFomwflzK4lFa3FEoPUVXCsyaS8kUI472AvhQZK7DUqmbWmn844qQpaYGhxXUMALVp6zUdjDfeVQyJUALONG3IMpb/aIdJQZhFqjnyTtvB/dtetgtqRLUq2ypSMQIoOwZrqT9wXmnyS6fq528wpyzn3vn7dIY8XfUB/wv97t4ZXiPhEIq4k3qOxNmLkkkEIc9PJQSCHk/RlvSD7/GPHHqrfy16QRJMlyhttJhjNhWBoblVRlr1SMdr1e5x93Xk4alQ8VTLF3fYW4OxIkXzLy9QzpTrYMTt5h/jmgGPy0Omqk7dHIrVaHMOYwKmcZwkiduNjYdOfRIQXhguNO0wfi2Elk4MPMpU6vOapa+yyA4XJnuIqwoEY8EKgdscroHU8ricES2kzZ78QRdavmFqPOiyWRfB+ri7GnffNOWYvkvwWwnBftxirqC9B8JoG0vY8/pNUKJD/yO0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199018)(33716001)(86362001)(316002)(4326008)(66946007)(966005)(6506007)(66476007)(186003)(6916009)(478600001)(66556008)(8676002)(53546011)(6666004)(26005)(6512007)(1076003)(9686003)(6486002)(83380400001)(38100700002)(7416002)(41300700001)(30864003)(8936002)(5660300002)(2906002)(84970400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pNCudaxTGCYHcrucjC5S3yfqxhk32S98o++HIXTqdQ9FL5oXt4T9p5NecniP?=
 =?us-ascii?Q?88VhGprVMKtfhRDjfMKLye16n1qG+2q4ZwhZnCP2r7jlwb1YA9UCHz/GvhVv?=
 =?us-ascii?Q?T/FJ00QlGSU5k2tXUK3RcLNfuHPIiEilbavkghLcNh5ybCYnLLCPaHYYrDBn?=
 =?us-ascii?Q?brRiLcY85QyQP3wP38491K7S/nDDADVhcfq59KDbFuXHU3pKuUM8UkD30EZY?=
 =?us-ascii?Q?0ovG0czE7psPGwhSgD+oRxzfl6BiLbbE9ATZx70C79PHruGVghC4/xQU/0SS?=
 =?us-ascii?Q?ip7qYnppz0JmpMx8dbVKeId1B7MHvXmxjTOXUik/MWnPiG4UYjaJV61Jkzy5?=
 =?us-ascii?Q?EXkJFzYMuHIm9ei4CS2JOukrNhLVIYOk0BYbaEDpC9trzp9zgjPdQFSy49PU?=
 =?us-ascii?Q?TCLLXjUdJUUf7SJzGNTBOXBUBgyOXXObHupH/ESmSZdzPwBsEOrnhXn85PwA?=
 =?us-ascii?Q?+BAl7VbxZYgOqiP8c2XujHisffOvL3FbWTWmkakYwxIvYodDGAUtWQQqYHEH?=
 =?us-ascii?Q?6iYcL3qtQAXXO6aiuZ337jupJEJEKgN1XPIpwcMQP63T0BWVg2Zt3aNCif1B?=
 =?us-ascii?Q?91t8IxIabXC/zZ4PTPYatluFUmUlHl8m+kG51Tmev0tjAjpR4/VwWSZBwEsD?=
 =?us-ascii?Q?FGeVRSAf0Jiy3f37w7SzC64thsnGC7JRDM7U7/Rinh4AN1YQeuBUIjYfEdgg?=
 =?us-ascii?Q?mpMbHLy6x0e+vbuQXG5hk+DogSgGaI7wuCxqls9uvl2v4LjHZB3tnjNjtH1t?=
 =?us-ascii?Q?63QPpTkzjM2rQJbhWb6wSceoGkvcdw7AeV8hN/mG2hiwFcK1fUsOZybtwNTI?=
 =?us-ascii?Q?XsRu+f1wppX5uN7Ui+zLedOPOpHzCStQHCCcTbZCjDMh4mUlm3X8xMOvrY/q?=
 =?us-ascii?Q?/47JznQf7Zwroix6zKzC9DHUwfu9jUgJSWV9+QCuVW/UKnjagWBn4Ixor/ZN?=
 =?us-ascii?Q?cRSMYLF5BinLiFr9LEUfF0I7mghuF2NAExQqtkl0OFjz33NI7elp/+m8jhaV?=
 =?us-ascii?Q?aTVmgiFN9WlCU0WSKxP6HvFrMEP12szAM7z7aY2y6Sz2DKMMZjQWOxr7AUm1?=
 =?us-ascii?Q?51NfCTflLfujoc2vckP493QL70xMO2cc0E2YIHOgORYz0egyvKOvAmBzdwGQ?=
 =?us-ascii?Q?UylMQLoOPnqKa6qNHDrKBPSQ2I1ymFsm4sJs+JE2hOnrAQIYgLDRZDzLlxmX?=
 =?us-ascii?Q?1Jdsx5xc8jZl1lgPMqHCZHqcCRUBR9s+vqf3i0dQxaoAiaPPOlgDeprTGeNP?=
 =?us-ascii?Q?Iyd4hT0vrIuojoVsDkuVLR9SnZa9qoyyg64ImPlorb5+0ydVNVelKChrUBau?=
 =?us-ascii?Q?2pdCKngdvdzTQh/1+0vcY/4dAFl3lYEWH71b+WlY+GMD78CFcDFbCrFi2eAF?=
 =?us-ascii?Q?K09OBojx6PenWIScKFCdMF5SNk+tbr2Kz1ieKZq+ZBxfv2/GuGUlVJLfRNuc?=
 =?us-ascii?Q?eEWsnUTjEpAKYKyL+JaR5XTyX93pmZmFPnMswKGOqJ1XHh95ud/rrhPwowN+?=
 =?us-ascii?Q?LGp3lKhvK6aNWlRXCiN1UQYwgfxxW4fNrS2oA5r2jA0kG1nDLw3oG4xGapwQ?=
 =?us-ascii?Q?dKb679bVW8+tU+sxAf6LHRIv/mE6KhBcPkbpWdHIHzxjryh6yggMvM/N5rV9?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?VYv3cG0YoOuBodRYVe6l4uzxhdp4y2fbj/80hra+RH6GtGWzyxEOvmPv3vCZ?=
 =?us-ascii?Q?lzRGiaY1JpAcXoRQ4/HMDTroiM0Db6GC2tSHNqKp8tVw4vyMVgyGPfixGz1f?=
 =?us-ascii?Q?oQNo1vmvSYpMB+2Mbo1MqLp6SQt+BeGyZkmTOsanr0MCCfowwkO9UI+FUL+8?=
 =?us-ascii?Q?7ZBmWkFzhKW6LFz3FrgFRTCMTG3KXJGPHJbiBG871DW3YEx3mlbj0Lm3ox7e?=
 =?us-ascii?Q?cCQ3RX9R3KJ5p7F6m3Gvbb5Q9wYT3c939NV8xMCSCuBizS8/uz60pomNTRbQ?=
 =?us-ascii?Q?hp5gLV/661KU2CKOZ8oCM+idJ+9R92UnsrP3oBzQYBRyhbeL3MD/hHJiQP5t?=
 =?us-ascii?Q?NOrwa4JZz+LjMnXC5Sa7zpOOh7Xgrt7l1fsp/hQHx5HMpWSo8UeTSs/bGBNh?=
 =?us-ascii?Q?BjXosIqXTLgp4K++2MTGEZsZuxXT/HF/hW4SVUciUm3QVhbxLrfRo7cS12S+?=
 =?us-ascii?Q?QeDP/HaDKj43yfrw+h5s7qj6xvETX1IimsjCY+AaWn+wC38CsqPS57AnMlpQ?=
 =?us-ascii?Q?6xSfh9sg/dmCIc2LaynYBty24GQVTSUaZ3M/smLcnuPNakhrIRnlFIY6fBep?=
 =?us-ascii?Q?hNuhpakaVRGQldRgdP31fxoRotpBXdacthu1TzebDmPQVJ7VDACRmMBZOcQ+?=
 =?us-ascii?Q?vEuWU/F5an06ovv81W095fjbfgsWCP95xUVGtt3Bpi/xhRtRWf273b/R+lu2?=
 =?us-ascii?Q?PQ02zsV2MUH6nVt7meGHGmJMskaYx+9R+tui7wi3N7hvWb6cSbGZfsIU8+QZ?=
 =?us-ascii?Q?ikl3pJuas7FIkMWt5k12SnMmcRRfC7gplpXrWsOkFqv08CDMPcMkjvUUH1L+?=
 =?us-ascii?Q?VPvKqldReP/TF1qKIAEdhjPkLhNK0d8GYMRciG1QJH2CNfcZaFtW23vhtvBl?=
 =?us-ascii?Q?MVBt5g9ZRB8X+uHjoMJ/4GNpbwT2h+f0J5zN5wzJhaJDfQEbTo16Y0nEXr56?=
 =?us-ascii?Q?94G8OrshK8ejLxuVov6H60vVS3bY8O2Nm4klasut1QLUVy5HUZgKQE1nOtIP?=
 =?us-ascii?Q?nQF6vf4ozuf4ZImk0w3rIq6L901pevd2BNS0avEoaljWH5+yt2duDv3qj7pJ?=
 =?us-ascii?Q?0DqT9ZRNrdW9riOHsS43AJQnMTUi51iZHYP0r2ByU0xS2MIUdP5NfOf7/8R6?=
 =?us-ascii?Q?Vl4nwY9BtOjMbJ5PTb+RBjuoCavJK7HElg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a2e8eb-ab9d-49bf-f81e-08db2977a040
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 19:16:37.3578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gya+GH43um9aCuePHJsauGnVI65dvqIKYqr4s4XDHaHOVbSSfRCkeqMFrdVmuEfIjNcRyVWF/ZYLfbUALRiE4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_16,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200161
X-Proofpoint-GUID: JD8If1SYT56Y0T441pOJcVo74OSMUqlr
X-Proofpoint-ORIG-GUID: JD8If1SYT56Y0T441pOJcVo74OSMUqlr
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Dave Airlie <airlied@redhat.com>, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230313 19:46]:
> On 3/7/23 23:43, Liam R. Howlett wrote:
> > * Danilo Krummrich <dakr@redhat.com> [230306 10:46]:
> > > On 3/2/23 03:38, Liam R. Howlett wrote:
> > > > * Danilo Krummrich <dakr@redhat.com> [230227 08:17]:
> > > > 
> > > > ...
> > > > > > > Would this variant be significantly more efficient?
> > > > > > 
> > > > > > Well, what you are doing is walking the tree to see if there's anything
> > > > > > there... then re-walking the tree to store it.  So, yes, it's much more
> > > > > > efficient..  However, writing is heavier.  How much of the time is spent
> > > > > > walking vs writing depends on the size of the tree, but it's rather easy
> > > > > > to do this in a single walk of the tree so why wouldn't you?
> > > > > 
> > > > > I will, I was just curious about how much of an impact it has.
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Also, would this also work while already walking the tree?
> > > > > > 
> > > > > > Yes, to an extent.  If you are at the correct location in the tree, you
> > > > > > can write to that location.  If you are not in the correct location and
> > > > > > try to write to the tree then things will go poorly..  In this scenario,
> > > > > > we are very much walking the tree and writing to it in two steps.
> > > > > > 
> > > > > > > 
> > > > > > > To remove an entry while walking the tree I have a separate function
> > > > > > > drm_gpuva_iter_remove(). Would I need something similar for inserting
> > > > > > > entries?
> > > > > > 
> > > > > > I saw that.  Your remove function uses the erase operation which is
> > > > > > implemented as a walk to that location and a store of a null over the
> > > > > > range that is returned.  You do not need a function to insert an entry
> > > > > > if the maple state is at the correct location, and that doesn't just
> > > > > > mean setting mas.index/mas.last to the correct value.  There is a node &
> > > > > > offset saved in the maple state that needs to be in the correct
> > > > > > location.  If you store to that node then the node may be replaced, so
> > > > > > other iterators that you have may become stale, but the one you used
> > > > > > execute the store operation will now point to the new node with the new
> > > > > > entry.
> > > > > > 
> > > > > > > 
> > > > > > > I already provided this example in a separate mail thread, but it may makes
> > > > > > > sense to move this to the mailing list:
> > > > > > > 
> > > > > > > In __drm_gpuva_sm_map() we're iterating a given range of the tree, where the
> > > > > > > given range is the size of the newly requested mapping. __drm_gpuva_sm_map()
> > > > > > > invokes a callback for each sub-operation that needs to be taken in order to
> > > > > > > fulfill this mapping request. In most cases such a callback just creates a
> > > > > > > drm_gpuva_op object and stores it in a list.
> > > > > > > 
> > > > > > > However, drivers can also implement the callback, such that they directly
> > > > > > > execute this operation within the callback.
> > > > > > > 
> > > > > > > Let's have a look at the following example:
> > > > > > > 
> > > > > > >         0     a     2
> > > > > > > old: |-----------|       (bo_offset=n)
> > > > > > > 
> > > > > > >               1     b     3
> > > > > > > req:       |-----------| (bo_offset=m)
> > > > > > > 
> > > > > > >         0  a' 1     b     3
> > > > > > > new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
> > > > > > > 
> > > > > > > This would result in the following operations.
> > > > > > > 
> > > > > > > __drm_gpuva_sm_map() finds entry "a" and calls back into the driver
> > > > > > > suggesting to re-map "a" with the new size. The driver removes entry "a"
> > > > > > > from the tree and adds "a'"
> > > > > > 
> > > > > > What you have here won't work.  The driver will cause your iterators
> > > > > > maple state to point to memory that is freed.  You will either need to
> > > > > > pass through your iterator so that the modifications can occur with that
> > > > > > maple state so it remains valid, or you will need to invalidate the
> > > > > > iterator on every modification by the driver.
> > > > > > 
> > > > > > I'm sure the first idea you have will be to invalidate the iterator, but
> > > > > > that is probably not the way to proceed.  Even ignoring the unclear
> > > > > > locking of two maple states trying to modify the tree, this is rather
> > > > > > inefficient - each invalidation means a re-walk of the tree.  You may as
> > > > > > well not use an iterator in this case.
> > > > > > 
> > > > > > Depending on how/when the lookups occur, you could still iterate over
> > > > > > the tree and let the driver modify the ending of "a", but leave the tree
> > > > > > alone and just store b over whatever - but the failure scenarios may
> > > > > > cause you grief.
> > > > > > 
> > > > > > If you pass the iterator through, then you can just use it to do your
> > > > > > writes and keep iterating as if nothing changed.
> > > > > 
> > > > > Passing through the iterater clearly seems to be the way to go.
> > > > > 
> > > > > I assume that if the entry to insert isn't at the location of the iterator
> > > > > (as in the following example) we can just keep walking to this location my
> > > > > changing the index of the mas and calling mas_walk()?
> > > > 
> > > > no.  You have to mas_set() to the value and walk from the top of the
> > > > tree.  mas_walk() walks down, not from side to side - well, it does go
> > > > forward within a node (increasing offset), but if you hit the node limit
> > > > then you have gotten yourself in trouble.
> > > > 
> > > > > This would also imply
> > > > > that the "outer" tree walk continues after the entry we just inserted,
> > > > > right?
> > > > 
> > > > I don't understand the "outer" tree walk statement.
> > > 
> > > I think I could have phrased this better. I just mean "my" iterator walking
> > > each tree entry rather than an internal tree walk, as it happens in e.g.
> > > mas_walk() or mas_find().
> > > 
> > > > 
> > > > > 
> > > > >              1     a     3
> > > > > old:       |-----------| (bo_offset=n)
> > > > > 
> > > > >        0     b     2
> > > > > req: |-----------|       (bo_offset=m)
> > > > > 
> > > > >        0     b     2  a' 3
> > > > > new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > > > > 
> > > > > Again, after finding "a", we want to remove it and insert "a'" instead.
> > > > 
> > > > Ah, so you could walk to 0, see that it's NULL from 0 - 1, call
> > > > mas_next() and get "a" from 1 - 3, write "a'" from 2 - 3:
> > > > 
> > > >           0     1  a   2  a' 3
> > > > broken: |-----|------|-----| (a is broken in this 1/2 step)
> > > > 
> > > > mas_set_range(&mas, 0, 2); /* Resets the tree location to MAS_START */
> > > > mas_store(&mas, b);
> > > >           0     b     2  a' 3
> > > > new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > > > 
> > > > 
> > > > You can *probably* also get away with this:
> > > > 
> > > > walk to 0, see that it's NULL from 0 - 1, call mas_next() and get "a"
> > > > from 1 - 3, write "a'" from 2 - 3:
> > > > 
> > > >           0     1  a   2  a' 3
> > > > broken: |-----|------|-----| (a is broken in this 1/2 step)
> > > > 
> > > > mas_prev(&mas, 0); /* Looking at broken a from 1-2.
> > > > mas_store(&mas, NULL); /* NULL is expanded on write to 0-2.
> > > >               0    NULL   2  a' 3
> > > > broken':    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > > > 
> > > > mas_store(&mas, b);
> > > >           0     b     2  a' 3
> > > > new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> > > > 
> > > > You may want to iterate backwards and do the writes as you go until you
> > > > have enough room.. it really depends how you want to go about doing
> > > > things.
> > > 
> > > I see, again thanks for explaining.
> > > 
> > > I think I would prefer to either (1) have generic insert() function with a
> > > similar behavior as when iterating through a list or (2) have a function
> > > dedicated to the "split" use case.
> > > 
> > > 1) When iterating the tree inserting entries at arbitrary locations should
> > > not influence the next iteration step. Unless the new entry really is the
> > > next entry, but that'd be optional. I don't see a use case for that.
> > > 
> > > 2) Similar to how you broke it down above I could imagine a function
> > > dedicated to the split operation. This would be similar to what you mention
> > > for mmap below. However, it wouldn't be a single operation.
> > > 
> > > The GPUVA manager provides sub-operations to the driver for a single mapping
> > > request. Those can be an arbitrary amount of unmaps (for mappings "in the
> > > way", as you say below), one or two remaps (for splits at the beginning or
> > > end or both) and exactly one map (which is the last sub-operation adding the
> > > newly requested mapping).
> > > 
> > > Remaps consist out of the mapping to unmap and one or two new mappings to
> > > map. The only case where a remap sub-op has two new mappings to map is when
> > > the newly requested mapping is enclosed by a single existing mapping. If we
> > > overlap a mapping at the beginning and another one at the end this would be
> > > two separate remap sub-ops. Of course, between the two remaps there could be
> > > an arbitrary amount of unmap sub-ops.
> > > 
> > > Unmap sub-ops are simple, I just need to remove a single entry in the tree.
> > > drm_gpuva_iter_remove() should be fine for that.
> > > 
> > > For remap sub-ops, I would need a function that removes an entry and then
> > > adds one or two new entries within the range of the removed one. The next
> > > loop iteration should then continue at the entry (is any) after the range of
> > > the removed one.
> > > 
> > > However, I'm unsure how to implement this. Would I need to just do a
> > > mas_store() of the new entry/entries (since the nodes should already be
> > > allocated) and then clean up the nodes that are left with mas_erase()?
> > > 
> > > Let's say there is an entry A = [0 - 5] and I want to replace it with B = [0
> > > - 1] and C = [4 - 5].
> > > 
> > > Could I just store B and C and then somehow clean up the range [2 - 3]?
> > 
> > The most efficient way:
> > mas_set(&mas, 0);
> > // Walk down to 0
> > mas_walk(&mas);
> > // We are now pointing at A (index = 0, last = 5)
> > mas.last = 1;
> > // No walk here.
> > mas_store(&mas, B);
> > // Going to the next entry is very fast.
> > mas_next(&mas)
> > // We are now pointing at a fragment of A (index = 2, last = 5)
> > mas.last = 3;
> > // No walk here.
> > mas_store(&mas, NULL);
> > // Going to the next entry is very fast
> > mas_next(&mas);
> > // We are now pointing at a fragment of A (index = 4, last = 5)
> > mas_store(&mas, C);
> > 
> > Less efficient, but still fine:
> > // Walk down to 0 and store
> > mas_set_range(&mas, 0, 1);
> > mas_store(&mas, B);
> > // Reset to the top of the tree
> > mas_set_range(&mas, 4, 5);
> > // Walk down to 4 and store
> > mas_store(&mas, C);
> > // Reset to the top of the tree
> > mas_set_range(&mas, 2, 3);
> > // Walk down to 2 and store
> > mas_store(&mas, NULL);
> > 
> > 
> > > 
> > > Maybe 1) would be the most flexible way, however, if 2) can be implemented
> > > more efficiently that's perfectly fine too.
> > 
> > You can do anything you want, but the more you can use the same maple
> > state and save walking from the top the more efficient it will be.
> > Every level is another dereference down the tree..  We do have a
> > branching factor of 16 here, so I don't know the size of your tree and
> > how worth the effort it is for you.
> 
> I think it could be worth taking the first approach and providing functions
> that are tied specifically to the use cases of the GPUVA manager, rather
> than generalizing them too much and re-walk the tree more than necessary. I
> think the size of the tree can be up to a couple 100k.

A couple 100k VMAs?  As in 2 trees of 100k VMAs or 200k VMAs in a single
tree?  So that's 5 dereferences to walk from the root to the VMA.

> 
> Since some operations may be executed from dma-fence signalling critical
> sections I have a use case for mas_preallocate(). I was wondering if I can
> ignore the "entry" argument of mas_preallocate() and just pass NULL, since
> it's actually never used. What's the purpose of this argument? Or is it bug?

It existed to optimize the preallocations, but that functionality was
never completed.  It is slated to be dropped by a patch [1] in the
mm-unstable branch.  I am not sure it's worth doing the optimization
after the zeroing fix [2] of the maple nodes.  If you find the
preallocations are too large and causing issues, we can revisit.. but
with a 5 level tree, we will allocate 16 nodes and almost always have
extras - we get 16 nodes per page.

If you have sparse data, then I would start to get concerned after ~524K
VMAs, then we'd be looking for 2 pages.  More compact data can run up to
~1.04M before needing 2 pages.  Then again, two pages doesn't seem like
a lot for such a large task.

How sparse is your data, on average?

[1] https://lore.kernel.org/all/20230110154211.1758562-1-vernon2gm@gmail.com/T/#u
[2] https://lore.kernel.org/all/20230105160427.2988454-1-Liam.Howlett@oracle.com/ 

Thanks,
Liam

...
