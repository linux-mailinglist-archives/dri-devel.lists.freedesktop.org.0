Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6621482768
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 12:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D548A89D89;
	Sat,  1 Jan 2022 11:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226B489D87;
 Sat,  1 Jan 2022 11:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ8LF+4znTy1KxqQwaizxeMNHuJeEfrL4d0SnTTjHCng/yxpDEpeH/tARti7XNZsH3vepC/BHgZOyVQ79plWCViPNLgV482DLHLcjrVOPG/FX9d3hCfjgyFFhzL8e64dw7JJTOQDJnf/mO+CBbMCLNnDPmsS/ZikvchNR+J/dDk1s7hg8Tac2HgGiiS6fTB5hPL6FwZHFiBgWBRFLoj5a0ZQnOlia99zhQy9tFpk9iSFoJ8CNaYqtjv6I+Yf03dnqAXOejeiNUSamt9awCG/uNMCmmqBY4oAFYv9PMGALUprwf+lkNd2v+E4MSlgfBl9xRIiPlDN00FL7c2y40TZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEc+o40Phw17+Vm4JOQfwNStJCQvFbxAnej2UtKIFlk=;
 b=mcf2tpef8YnNcFfePEFVoAWZ3eV6SnFpkxE8ITnubmjt7a+VBoHCJtdSbvj1Y/30CXlz9PhOGyH4l0iQg+ycjKICrtYe2HVCOQ8R40Mn9BvomUhefgE+8Je7REQnUCHHJcGyxfWR1XYA9QyFudxUQZewycr1vLcdY2RllU5LVocrXMQCMBaZspcirC7UywR/FGAsG4LJClTwIch81LNtiPSVz60yp2rzcnaPryIErMzAQnFazUmUbMRKycCiFGswccIRwua9ktfBfGWS0q9B4uZi8uWxR7zPq+OpYNytyhoAPpdDqmjTdEVNCWkPN+/+SUQnWh7T4S9vkb9mAmCygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEc+o40Phw17+Vm4JOQfwNStJCQvFbxAnej2UtKIFlk=;
 b=DL0ARV9q1qAUWXwc1MJIpjKpO+Hf+K4Gs0bb/nY4TXjc6yseB7kR+H68Vzh+fbe44f+khbZ7f3mRWMU0p7jQTDPLZniTkPyPfY3XvIeQ8QAQ9drkVPBLwD3Aq1MipAehEZyFRT3j8Yb9OLIkAeGgrZx1MmyfxefPlWOX7Z5pc1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4476.namprd12.prod.outlook.com
 (2603:10b6:303:2d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Sat, 1 Jan
 2022 11:19:01 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4844.015; Sat, 1 Jan 2022
 11:19:00 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IFtQQVRDSF0gZ3B1L2RybS9yYWRlb246Rml4?=
 =?UTF-8?Q?_null_pointer_risk?=
To: =?UTF-8?B?5rip5b+X5Lyf?= <wenzhiwei@kylinos.cn>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <xfsceflzgr-xftmc911ak@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6e676e19-b6c8-579a-df76-9947a2fc4145@amd.com>
Date: Sat, 1 Jan 2022 12:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <xfsceflzgr-xftmc911ak@nsmail6.0>
Content-Type: multipart/alternative;
 boundary="------------A1EFA530548228487156E3EE"
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::13) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f78c8356-050d-48c2-7f63-08d9cd188283
X-MS-TrafficTypeDiagnostic: MW3PR12MB4476:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4476B1E6FC41BA6C5D6D115183479@MW3PR12MB4476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWp3kMGge65Omdwa5vlrnbWkQ8mBn14/+4bqYpVxmuxOqWNsFlMmKlBMXRfXWeS7iLwpFetkMccCiMJBqzLnX/v/Hbvp6LYJgxgHO5C4SGh7d9wTu2+gWkoBzavD7Fv/3ke5T+janvmql0ccpgLUUTVsq+Nck5/MH73joz+YUmRLWr7qkZGHAkXknBHaJvDD8K3HDzNVkCM+wjDYG8SCdemvLP4xPFvaqvd6dLPG6cCG7dbdx5UBXH3bcrTyJxOYBJNeMuiz1G3b31TUwivCWKtTGrT4FGG7Auc7RDbQFWUHPh0VEq+ymCmjYA0KhotrCEWnVT/aUARcnQNHji/XtYN+65FSL2aNa3n6Lx4TsoYOBQNvFzBxww6fQJPzup9IzRqozFBYj5gjQey69ROz8s03/E5+kps9NKLsrY8+XH1bYtCkYk7J8s4D5N8SyBFAWSszF9unP7fMuk1O8dDsloc56DUALFUbsc51QCJXOak6gS7+SeGY82gj/OnvxnTayVdBeLgKBs34PqMPuNw9r76phNlqOUe7RNGC/q60/MPHCTtzUdLmbfnAHbVJPsWz5gqFbDqiP1GXLlUTQIh4HNaL/QF7c3I6HLNLBqe2+rZHuVKibn9FlTKNHlBuMRxRNGMKrBFDx+h8hmBj6pyrxrs0/zHayIU2TKEagq8jv9fLxyq15DNiGL+w/aJurWqdReSZ1pe+YVkeb460qsigYcFKmifLp0d80bCI+f78yRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(186003)(4326008)(6666004)(2906002)(83380400001)(31696002)(6512007)(6506007)(6486002)(5660300002)(224303003)(4001150100001)(508600001)(31686004)(66476007)(66556008)(36756003)(2616005)(38100700002)(86362001)(33964004)(316002)(66946007)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmRsWS85WTlQYU5ibTRDUWUxYy9uQnZvUkpxY2Y0NnRDRFVaOXNJS2Ztb0Mz?=
 =?utf-8?B?TmVIbGU2REFJZ01pK3lkZjVGbmc2a1dOVzBHa2o5Qm9kbUQ1NTQ5bEYwaUtN?=
 =?utf-8?B?VS9EN055VzEwSXEwVDJlKzhBenIzK0NmVFAvMmZtV2tNUDkyVTNUL012K0pZ?=
 =?utf-8?B?ZDRZZUh3b1FObHMvK2lwTkRQNzdpRUtQM2R1Zm5URGZ6ci9DUDdFQVo1K2lT?=
 =?utf-8?B?b2FZeG1uM0xoaTVPendzU1NFTi9KTmNHY1Q0OTMvMEt2VytGTXYxMVdDQ2dp?=
 =?utf-8?B?bTFrYjVlb0JNR0ZQS1E5R04yMWtWY0dUVnpKMjJIMXZGYkF0Tk15bzJYUVBn?=
 =?utf-8?B?L2pEVEFqVDdUMVY4Umd0MnBSUGJXQTNld25EZGQ1SzJoT2Q2MjJLaEJrYlZz?=
 =?utf-8?B?RGtweTJWbXVlK21sbGJtcE0vblpZWHozRWlTTWVtTXdZU29zWCtYaHZ4U09a?=
 =?utf-8?B?N0FCVUVzOTQ5WmgrSzZmYzZ4VzVuZVFNS3QwNEwxNndETDNBU3BENEN2M3FD?=
 =?utf-8?B?QTFGT2EvMml2cHZVSjZqUXl5Vklvam9sZjNwRXREbUpSZDJUUmplaVR3Vkh6?=
 =?utf-8?B?ejdLUC9VaDAwS0JIQ09EYk91NVpDTzNwVUtod0sydnM2cVNTSWNYMVJzbVEw?=
 =?utf-8?B?UTVRNGNJYmpVMHdWVzFSSlhmZFdjNWhacG5JM1Y3SG1xUFFOUHZOZWxpdW82?=
 =?utf-8?B?YkVTUWQ3Smh4a3ZxY05IN3VvcGV0QXVka09vM3Q5N0Z3Y29XcGFsR1RtR093?=
 =?utf-8?B?VWh0bUdDMGlPV2tHMWFDdURFT2V5OElvWFE1SlZKcllROXJJMFUyMHk1Wklr?=
 =?utf-8?B?LzdqbTEvc0wyMDB1UjAvaHJBaHVEeHVZQ2ZySElCV3ZxRS8wcEFsanBMeDRM?=
 =?utf-8?B?MW00U0YxVlpwUmVYQzJyYkJoMDZhYU1DQjZuRHVOSTVpaDJJWDhJajV1cm1V?=
 =?utf-8?B?LzRvUzRaZ2dtcGdRbkQxVnZoMXBlTjdKQ2hoeHdxSWhqd2ZSaVRralJLNHho?=
 =?utf-8?B?U2dSZWRac20vaUpOekNWMEpnMWxkY1VyQ1JUS1FBMTFVOFJ5eTVmU0x1MXl6?=
 =?utf-8?B?cCtZdDg3UTNCdFJzamZEWFNseXZoS1pPSisvRVNRV0Z1TFZlanQrS21aV2JL?=
 =?utf-8?B?TEgrZlRscWtybUhHRGJXTy9vSmNvS2prakMwSTJLTStPZDNSUFV1OVNsQ3lQ?=
 =?utf-8?B?SUpoaCs3cXFSTVU1VWV1UVhiWkVCVTE1eXhxZFlUcnJ2cGIvZHQrY2VpcmZP?=
 =?utf-8?B?TTdEbEpGTTZzdTdIVzZmck1kWjlGRUU1Y3lJRVAvUWsyK2FRdXVwaWNwS3Fp?=
 =?utf-8?B?aFJ3d3A3cFVmdEFHUkJvVkIwcWxpRlNGVmY2TnNPL1QwcTBaYzVJaDNRYTlt?=
 =?utf-8?B?bGZaRFBxY3plVnFzMlA4elkzRlhkWEh6TUtUeDJob2hZZE1Fc0J2ZUZUS2Vs?=
 =?utf-8?B?dGpWaHMrWXF5b3JWZ294RnlpTVBJdEhxaUIySkdRVFdvRlJDY3lOWlRsVU93?=
 =?utf-8?B?SzJVcGQ5cisrU2IxeTM3cGhnQ2NBTEZKNG80eE5obFhjdng0MGo4ZmFuaDRD?=
 =?utf-8?B?MUVCbGRTcTlvZ2Q3OWhIdlhuYk5TL3FWUGNXZmxGdzR0WUgxWXFDWnpkRDhI?=
 =?utf-8?B?dEtiTVYzM0lyTVR3T29DYS9IZHluL0wvS2N0M2ZCNFJ2YnV2dC8vYTdzQXYw?=
 =?utf-8?B?YVloYWkwcXE4M3RteXRqdkRSTk54NEdqNHRkVnZwM05BZ01vWFMwcnM4NFBs?=
 =?utf-8?B?NkIrZDJXZmUxL28rTWcyU1ZBWkVsVU9kdE9PUFRtdkU0NVU0ekpRaHl4aTBy?=
 =?utf-8?B?U0hESHl3ejFjNGswbTY1cG84TGk3NnIrdEpNT1Z6VGl1MVZMQkh4QWZmVnd3?=
 =?utf-8?B?cTN6dVJZZFA3dkxiQ2JOdUsvdFJXU2JrYmdsbHRPTy9tRUhjajVCeFZLelZ5?=
 =?utf-8?B?ZEltZEJyanpERnBKRklXNDAwOTRjNXpxTVJqRDNMaTFCaUczdENOVTg1eHgv?=
 =?utf-8?B?SzcxME54Zjcza0QvT3ZpbzhtKzF5bDhic2N0ZDduZFRTL0dBVGZ2UzRDWFhZ?=
 =?utf-8?B?Z2pIWTI5M0xyTkRsWWo3eWlUMkxKOUVKdjhFc2JlYjJVSXJmYUtVTFQvQk4y?=
 =?utf-8?B?UXpXVG5VNFYxZ0traHdPNFBGTkpOK0tFVUFXZTF2TlJWZzcxd091eHYrN0xh?=
 =?utf-8?Q?DKp16GcCt4X6LhJum6vp34c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78c8356-050d-48c2-7f63-08d9cd188283
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2022 11:19:00.7669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlUXUtZXoog+McqXiXSWfRQ6XsAIZ98B3GeDB5S7TGhqgSgx6zUfAtY+HnvLvnUT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------A1EFA530548228487156E3EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 31.12.21 um 09:37 schrieb 温志伟:
>
>
>
> Then the judgment in line 944 is needed. Are the possibilities of 
> these two positions consistent.
>
> Why keep this judgment？
>

Because when mem is non-NULL bo_va->bo can't be NULL either.

Regards,
Christian.

>
> Regards,
>
> Wen Zhiwei.
>
>
> ----
>
>
>
>
>
> *主　题：*Re: [PATCH] gpu/drm/radeon:Fix null pointer risk
> *日　期：*2021-12-31 00:36
> *发件人：*Christian König
> *收件人：*Wen 
> Zhiweialexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.ch 
>
>
> Am 28.12.21 um 08:31 schrieb Wen Zhiwei:
> > If the null pointer is not judged in advance,
> > there is a risk that the pointer will cross
> > the boundary
>
> As far as I can see that case is impossible, why do you want to add a
> check for it?
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Wen Zhiwei
> > ---
> >   drivers/gpu/drm/radeon/radeon_vm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_vm.c 
> b/drivers/gpu/drm/radeon/radeon_vm.c
> > index bb53016f3138..d3d342041adf 100644
> > --- a/drivers/gpu/drm/radeon/radeon_vm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> > @@ -951,7 +951,7 @@ int radeon_vm_bo_update(struct radeon_device *rdev,
> >
> >   if (mem->mem_type == TTM_PL_TT) {
> >   bo_va->flags |= RADEON_VM_PAGE_SYSTEM;
> > - if (!(bo_va->bo->flags & (RADEON_GEM_GTT_WC | RADEON_GEM_GTT_UC)))
> > + if (bo_va->bo && !(bo_va->bo->flags & (RADEON_GEM_GTT_WC | 
> RADEON_GEM_GTT_UC)))
> >   bo_va->flags |= RADEON_VM_PAGE_SNOOPED;
> >
> >   } else {
>


--------------A1EFA530548228487156E3EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 31.12.21 um 09:37 schrieb 温志伟:<br>
    <blockquote type="cite" cite="mid:xfsceflzgr-xftmc911ak@nsmail6.0">
      
      <p><br>
      </p>
      <div class="viewer_part">
        <div>&nbsp; &nbsp;<br>
          <p>Then the judgment in line 944 is needed. Are the
            possibilities of these two positions consistent.</p>
          <p>Why keep this judgment？</p>
        </div>
      </div>
    </blockquote>
    <br>
    Because when mem is non-NULL bo_va-&gt;bo can't be NULL either.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:xfsceflzgr-xftmc911ak@nsmail6.0">
      <div class="viewer_part">
        <div>
          <p><br>
          </p>
          <p>Regards,</p>
          <p>Wen Zhiwei.</p>
          <p><br>
          </p>
          &nbsp; &nbsp;
          <p>----</p>
          <p><br>
          </p>
          <div id="re" style="margin-left:0.5em;padding-left:0.5em;border-left:1px
            solid green;"><br>
            <br>
            <br>
            &nbsp; &nbsp; &nbsp; &nbsp;
            <div style="background-color:#f5f7fa"><b>主　题：</b><span id="subject">Re: [PATCH] gpu/drm/radeon:Fix null pointer
                risk</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
              <b>日　期：</b><span id="date">2021-12-31 00:36</span> &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp;<br>
              <b>发件人：</b><span id="from">Christian König</span> &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp; &nbsp;<br>
              <b>收件人：</b><span id="to">Wen
<a class="moz-txt-link-abbreviated" href="mailto:Zhiweialexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.ch">Zhiweialexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.ch</a></span>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
            <br>
            &nbsp; &nbsp; &nbsp; &nbsp;
            <div id="content">
              <div class="viewer_part">
                <div>Am 28.12.21 um 08:31 schrieb Wen Zhiwei:<br>
                  &gt; If the null pointer is not judged in advance,<br>
                  &gt; there is a risk that the pointer will cross<br>
                  &gt; the boundary<br>
                  <br>
                  As far as I can see that case is impossible, why do
                  you want to add a <br>
                  check for it?<br>
                  <br>
                  Regards,<br>
                  Christian.<br>
                  <br>
                  &gt;<br>
                  &gt; Signed-off-by: Wen Zhiwei<wenzhiwei@kylinos.cn><br>
                    &gt; ---<br>
                    &gt; &nbsp; drivers/gpu/drm/radeon/radeon_vm.c | 2 +-<br>
                    &gt; &nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
                    &gt;<br>
                    &gt; diff --git a/drivers/gpu/drm/radeon/radeon_vm.c
                    b/drivers/gpu/drm/radeon/radeon_vm.c<br>
                    &gt; index bb53016f3138..d3d342041adf 100644<br>
                    &gt; --- a/drivers/gpu/drm/radeon/radeon_vm.c<br>
                    &gt; +++ b/drivers/gpu/drm/radeon/radeon_vm.c<br>
                    &gt; @@ -951,7 +951,7 @@ int
                    radeon_vm_bo_update(struct radeon_device *rdev,<br>
                    &gt; &nbsp; <br>
                    &gt; &nbsp; if (mem-&gt;mem_type == TTM_PL_TT) {<br>
                    &gt; &nbsp; bo_va-&gt;flags |= RADEON_VM_PAGE_SYSTEM;<br>
                    &gt; - if (!(bo_va-&gt;bo-&gt;flags &amp;
                    (RADEON_GEM_GTT_WC | RADEON_GEM_GTT_UC)))<br>
                    &gt; + if (bo_va-&gt;bo &amp;&amp;
                    !(bo_va-&gt;bo-&gt;flags &amp; (RADEON_GEM_GTT_WC |
                    RADEON_GEM_GTT_UC)))<br>
                    &gt; &nbsp; bo_va-&gt;flags |= RADEON_VM_PAGE_SNOOPED;<br>
                    &gt; &nbsp; <br>
                    &gt; &nbsp; } else {<br>
                    <br>
                  </wenzhiwei@kylinos.cn></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A1EFA530548228487156E3EE--
