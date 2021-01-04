Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F32E9520
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 13:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DA689D7F;
	Mon,  4 Jan 2021 12:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4193C89D7F;
 Mon,  4 Jan 2021 12:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b63U1WY0WvxH9PQ0wtz1xwob8DrvsnAX9YFJjOff/HcMpGKRD3IwP67tj366inQbKz+KkaM1xXsdu7qCsYLj7kHhYiGSji1Ak4C9yM97v3zH2QciAh8g0PZKEGiZvqVB9D+3uyK6gUJm/ZzE20OOJf8CLktYaSRep2DfRUq+pp/5cEXbCKCrUCDlTDp23rtKCashLXhFPFRdIAg6MgZN6HfeZYde8ZdLPTHoheII0T/jWPFA+vjecGXHCdp+xatAFDucX691lMRptJZoBYWc1EhbhUYxKHSNd/aLvDSrX3HRUzyML2IGXuKrcxCNDsTX+t4VWQZgMMImfg45xHXj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XAqmh7ziEuSbUb94y4CpuOH8fgBjdsm4fn4WPg9ecc=;
 b=lBdXh5/QLOO+swJME1g7k1d1JAjWKP81vsRBjsV6xOX+TaYY2xp5Rqa54W2QR9HgDL2TQ+Sgh0oK9EQc/pIonp9BQ66/j+7id30WKQkp10dhPw3qBz5j7g0jjrg6RL+PhgAz8Sy8kZdJbhD1NyXLNg8XqqvAz6TatCyv2mSjR5szo/3qRt2i5l3zYcHTnwDGgfhhKMp6xIPUxQyfzzmpu+QHvhqamJMDu2c7qQJDDucXA2OLX/rEl4pErqbvc0kEeNBeRxutGXWf9CwB93Ueh5BoVMswuHjUaPT+oRd3oNjnph2N6eYWPX9jtBSSrH4GkCj1DMn+camc2sKEdSmhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XAqmh7ziEuSbUb94y4CpuOH8fgBjdsm4fn4WPg9ecc=;
 b=worg8GJ3F9ooK3GLp4MbX/n8Q7hG6FNw1jv/IzRhocIWYlCWz+GJfka/Hwca8x1xd6gsyTCUSZfhq/BCyKnztcVtzEQX/DuOOAGJhmpW//cag7B37VJItmYAFyIPHoOwGiD2ifp5/KPCNAKzcwAEYWmEDePKpH8sTkylSSm12+c=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 12:44:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 12:44:24 +0000
Subject: Re: amdgpu does not support 3840x2160@30Hz on kaveri apu
To: Davide Corrado <davide@davidecorrado.eu>
References: <CAM0ywnxwE9bRafJJZcg4w8GooXiDrJKV0gt+p9XJv=Y6HrmA0w@mail.gmail.com>
 <4f208b1a-b90a-6afb-79a7-c5027f7529b2@gmail.com>
 <CAM0ywnycLPS9de-3QLhoreM=dNrsn4-=un8EFsw8Wf5g4z91Dw@mail.gmail.com>
 <CAM0ywnxfw6CngRnVhB-9f_5TOVaGe9KO6LJ310vqiguz=wj10Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b4448332-a11d-8d22-cc11-194c8f3670f4@amd.com>
Date: Mon, 4 Jan 2021 13:44:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAM0ywnxfw6CngRnVhB-9f_5TOVaGe9KO6LJ310vqiguz=wj10Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0076.eurprd07.prod.outlook.com
 (2603:10a6:207:4::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0076.eurprd07.prod.outlook.com (2603:10a6:207:4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 12:44:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a5bda828-49b9-4dd7-3b3c-08d8b0ae7777
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3997703A282D892AB4E7555483D20@MN2PR12MB3997.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: di2rf0zjR11CgGXeVIM2gn4BMqBsCkukr/AO8rwZaLkEFknHd41fBD8UUXZXAF2l1gaOYGv+9Kd37DBZbuzbfA13xbwKaOZ6+a7Ek0e1nRo0Bq4MXPpZCF3mqwk/rue2fM5vEAMJbGYkhZdsvNan+njWgB4pSGf91xQE8J5IjG3TOYcpxew9AgFIhOOrzVBteFIfu9Qb9hGWYx/M8f/YUz2sPCHqAWGRtrCbjMPyvkuMFWyfbC3Bv6M/4rZbhugGo/xdwJe03nMgrs3wvKwmYoTlK3m4NOELxeiyZdI6sPyAwYWp++LATgOQdIrxrKmQPgebJSIoacZG9fg61NassUh7Y+8UbwWsxqyWeCtUXddinfixT6KqOilQpe8aMCKJEYfp8vD21RoKP4kM79hzgSMWa6pNbyJdHvFW5bQwjA6yu/+yCu1w37wO/3NjymJM9A9O5RE0vw6RpG0rhk0LGYebk0Nht+s1rjv+yYftjTip7hHMpMwXGFoCWfU2mNm40yG5knwedBszaVq2+QW8ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(54906003)(5660300002)(33964004)(6486002)(8676002)(31696002)(52116002)(36756003)(66556008)(6666004)(966005)(316002)(166002)(8936002)(2616005)(478600001)(45080400002)(66574015)(2906002)(6916009)(86362001)(83380400001)(66946007)(16526019)(186003)(66476007)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djU0Nm9xb1ZwNXcyRHpSSlpGSnpyamdiaXRQUUY4YUMzbkVMUFpieUwvNzlV?=
 =?utf-8?B?WVlEYWw5Qng5WVZsQis0T01lK09zcG0wY1YxYWFoa0kxSEdMenpaTDFjOGVm?=
 =?utf-8?B?alNwUWgxSVNXOHlDalJCdk5pcUh6OFNhc1V5ZWZYajh1cHBpcTQyVnZzUjBK?=
 =?utf-8?B?ckZ2SVdmd0RTa2habGFuNUZ4YTUzZUR2N0ZqcllKV25pOVU2S09Dc21RMGtX?=
 =?utf-8?B?OWJOYWtnL3hnWGIzNjR1ZGhseUtlU3Mxa25SMjROSVRYMmxlZG1YNFJsbHhV?=
 =?utf-8?B?RE44aG5nSFFpY2xWa09HTU1iY2NUTDgwbmhsOFpqb1NSTmxOWmRmM1hyN0Z1?=
 =?utf-8?B?VEZxWVRZYmZkL2QrMjY4V1ZJTzZ2UE1jNFdNZUE5bmlKLzEwZ3pBK2NuY1RL?=
 =?utf-8?B?SjdZWmJiRUdyM2VzdGUyNkJlaE5jZVZCVi9HTk9aT3o3MmFSM2hudzhZTzNY?=
 =?utf-8?B?TXdqT2RWTjRvVGsrMXk2SURwNHcreFNReFU5cVY0ZjZoL2lvYVdseEtlVm5Z?=
 =?utf-8?B?Z2dWRytTY2I1THZ4VGFkY0NDcitvbGVvT0QzWEFHbHFROGM0ZUxGeVZ2aHB1?=
 =?utf-8?B?dVd3MzMvVnI5MlhwRW9Kb3NDaFFyejBQU2Y0UHAwYVlTNHBVN2NNOGdPeGhG?=
 =?utf-8?B?SWFRUWJ3ZFRIYS8wVXVuZ2pDYklPZDVlQ3RFZzEyQ3E4dWs1dVdlQnNkaERC?=
 =?utf-8?B?c05UQnd1UXE3L0FRMW8vVGFsYngxSXVwd2R0ZlFTazFYY2Rob0lWN1E5VkRu?=
 =?utf-8?B?TEVZZ3laeHVmNTNPTWVTRWpURUEzYzJwTXhEdVgzdmNRQlgxVTl2SWtFZm1y?=
 =?utf-8?B?TlB2RUpXVWhXelFIV2pYZlFiQ0VYWXA0VDQyOVFXUExUdFc2N29kZ2hGek04?=
 =?utf-8?B?MFhuZWd3MzBKYk9aTTVpWTRxOFh4QnBpOUhXd3V2VHFYT0RUYkwxMXQwY0M4?=
 =?utf-8?B?QkxUd1hxckJUZ0tNMExENjVJMjJ5dkdkVXBPTVNCTktiLzhyNzI1c3FERDFv?=
 =?utf-8?B?dC80VW9ZN2hmMlMyeE03Q1c3MGtsOWN5SGhsVXRuTUNXV21kd2ZWRE9uVWRU?=
 =?utf-8?B?MFg5S3BQdUsxbEgwSC90QTM1LzJsaWRqeGF3QmpKQWh6bmprdEl5ZEMrR2p0?=
 =?utf-8?B?Q2J5M01xZUY2NndDbTdxaHp3VGRFeVB4YTBBTUUyMXBhZWt0NElRd3VzQzl3?=
 =?utf-8?B?cXVmRWFtQ0tpN2xsUkpJN1NRUnhIQzFncm53K2ltaU56UWJ0S0R5NmFEOVBL?=
 =?utf-8?B?ZXhIM3B1V0ZHVEZhS0FSeHMvTEdiR1ByTXdsNnNmd055NUc3N3gvTWVlUldt?=
 =?utf-8?B?OHVMWk1VakpPUEdXQjd5Y0VHT0hvc2FENmhaOTV1Rld2SnJsekNwMG1vOTlQ?=
 =?utf-8?B?TmU1WFdYeWJuWHZOYW9IbC81RE9QSDJtdDMvYlJEZnRZN3gxcnpqUnQvQXI3?=
 =?utf-8?Q?hgqOp19Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 12:44:24.6986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bda828-49b9-4dd7-3b3c-08d8b0ae7777
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYnvaFZN5OU42ERMDpF55TF2cXyt4mgGBr0lYHADtGMdi5NQY9Uh1a6achKdJO74
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3997
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============0964712595=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0964712595==
Content-Type: multipart/alternative;
 boundary="------------A9EC2BF4495ED165E6EBB58F"
Content-Language: en-US

--------------A9EC2BF4495ED165E6EBB58F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Yes, absolutely. Do you only get a black screen?

That would certainly be a rather big bug.

Christian.

Am 04.01.21 um 13:37 schrieb Davide Corrado:
> Btw, should the driver switch to the lower supported resolution then?
>
> Il Lun 4 Gen 2021, 13:04 Davide Corrado <davide@davidecorrado.eu 
> <mailto:davide@davidecorrado.eu>> ha scritto:
>
>     Hello. This resolution is supported by the Apu and the motherboard
>     specs. Will try what you suggest and let you know
>
>     Il Lun 4 Gen 2021, 12:10 Christian König
>     <ckoenig.leichtzumerken@gmail.com
>     <mailto:ckoenig.leichtzumerken@gmail.com>> ha scritto:
>
>         Hi Davide,
>
>         adding a few of our AMD display people.
>
>         In general as already suggested by others opening a bug report
>         to track this is the right thing to do.
>
>         In the past we had a few bug reports like this because amdgpu
>         is more strict in checking hardware limitations.
>
>         For example it can be that your HDMI port on the board can
>         only handle a certain maximum pixel clock, but radeon is
>         ignoring this while amdgpu isn't.
>
>         What you can try to do is to manually override the used mode,
>         e.g. copy the modeline used when radeon is active and manually
>         add that using xrandr when amdgpu is active and see if it
>         works or not.
>
>         Regards,
>         Christian.
>
>         Am 02.01.21 um 19:50 schrieb Davide Corrado:
>>         hello, I'd like to report this issue that I am having since I
>>         updated my display (samsung U28E590). The amdgpu does not
>>         support the native resolution of my new monitor, which is
>>         3840x2160/./ Using a HDMI or DVI connection (I tried both,
>>         same results), the maximum supported refresh is 30Hz, so I'm
>>         stuck with that (don't have a displayport). The radeon module
>>         works fine, I'm having this issue just when I use amdgpu
>>         (which I'd like to, because performance is better).
>>
>>         Some info of my hardware:
>>
>>         cpu: AMD A10-7870K Radeon R7, 12 Compute Cores 4C+8G
>>         kernel version (I tried different ones and different linux
>>         distros, same results!): 5.9.16-200.fc33.x86_64 #1 SMP Mon
>>         Dec 21 14:08:22 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
>>         Monitor: Samsung U28E590.
>>
>>         description:
>>         If I boot the system using amdgpu and no video mode
>>         selection, the system boots but I don't get a screen during
>>         boot and in wayland. I can connect using ssh, so the system
>>         is running fine, just no display; If I force a full HD
>>         resolution with "video:" in the kernel line, I can see the
>>         boot process but the screen disappears when wayland starts
>>         (because the default resolution is 3840x2160@30Hz). Using a
>>         full HD monitor results in no issues, so it must be related
>>         to this very 4k resolution.
>>
>>         As I have already stated, radeon module works with the same
>>         software/hardware configuration.
>>         thanks you so much for your time :-)
>>
>>         -- 
>>         Davide Corrado
>>         UNIX Team Leader
>>
>>         Via Abramo Lincoln, 25
>>         20129 Milano
>>
>>         Tel +39 3474259950
>>
>>         _______________________________________________
>>         amd-gfx mailing list
>>         amd-gfx@lists.freedesktop.org  <mailto:amd-gfx@lists.freedesktop.org>
>>         https://lists.freedesktop.org/mailman/listinfo/amd-gfx  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&data=04%7C01%7Cchristian.koenig%40amd.com%7C59d6be6931904c8cc54608d8b0ad907d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637453606812577161%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=WVyIYAbdsLrXtHu8TLObzx68cXuXoRkr5VPOPT6NwCQ%3D&reserved=0>
>


--------------A9EC2BF4495ED165E6EBB58F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Yes, absolutely. Do you only get a
      black screen?<br>
      <br>
      That would certainly be a rather big bug.<br>
      <br>
      Christian.<br>
      <br>
      Am 04.01.21 um 13:37 schrieb Davide Corrado:<br>
    </div>
    <blockquote type="cite" cite="mid:CAM0ywnxfw6CngRnVhB-9f_5TOVaGe9KO6LJ310vqiguz=wj10Q@mail.gmail.com">
      
      <div dir="auto">Btw, should the driver switch to the lower
        supported resolution then?</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">Il Lun 4 Gen 2021, 13:04
          Davide Corrado &lt;<a href="mailto:davide@davidecorrado.eu" moz-do-not-send="true">davide@davidecorrado.eu</a>&gt; ha
          scritto:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div dir="auto">Hello. This resolution is supported by the Apu
            and the motherboard specs. Will try what you suggest and let
            you know</div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Il Lun 4 Gen 2021, 12:10
              Christian König &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com" target="_blank" rel="noreferrer" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;
              ha scritto:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div>
                <div>Hi Davide,<br>
                  <br>
                  adding a few of our AMD display people.<br>
                  <br>
                  In general as already suggested by others opening a
                  bug report to track this is the right thing to do.<br>
                  <br>
                  In the past we had a few bug reports like this because
                  amdgpu is more strict in checking hardware
                  limitations.<br>
                  <br>
                  For example it can be that your HDMI port on the board
                  can only handle a certain maximum pixel clock, but
                  radeon is ignoring this while amdgpu isn't.<br>
                  <br>
                  What you can try to do is to manually override the
                  used mode, e.g. copy the modeline used when radeon is
                  active and manually add that using xrandr when amdgpu
                  is active and see if it works or not.<br>
                  <br>
                  Regards,<br>
                  Christian.<br>
                  <br>
                  Am 02.01.21 um 19:50 schrieb Davide Corrado:<br>
                </div>
                <blockquote type="cite">
                  <div dir="ltr">
                    <div>hello, I'd like to report this issue that I am
                      having since I updated my display (samsung
                      U28E590). The amdgpu does not support the native
                      resolution of my new monitor, which is 3840x2160<i>.</i>
                      Using a HDMI or DVI connection (I tried both, same
                      results), the maximum supported refresh is 30Hz,
                      so I'm stuck with that (don't have a displayport).
                      The radeon module works fine, I'm having this
                      issue just when I use amdgpu (which I'd like to,
                      because performance is better).</div>
                    <div><br>
                    </div>
                    <div>Some info of my hardware:</div>
                    <div><br>
                    </div>
                    <div>cpu: AMD A10-7870K Radeon R7, 12 Compute Cores
                      4C+8G</div>
                    <div>kernel version (I tried different ones and
                      different linux distros, same results!):
                      5.9.16-200.fc33.x86_64 #1 SMP Mon Dec 21 14:08:22
                      UTC 2020 x86_64 x86_64 x86_64 GNU/Linux</div>
                    <div>Monitor: Samsung U28E590.</div>
                    <div><br>
                    </div>
                    <div>description:<br>
                    </div>
                    <div>If I boot the system using amdgpu and no video
                      mode selection, the system boots but I don't get a
                      screen during boot and in wayland. I can connect
                      using ssh, so the system is running fine, just no
                      display; If I force a full HD resolution with
                      &quot;video:&quot; in the kernel line, I can see the boot
                      process but the screen disappears when wayland
                      starts (because the default resolution is
                      3840x2160@30Hz). Using a full HD monitor results
                      in no issues, so it must be related to this very
                      4k resolution.<br>
                    </div>
                    <div><br>
                    </div>
                    <div>As I have already stated, radeon module works
                      with the same software/hardware configuration.<br>
                    </div>
                    thanks you so much for your time :-)<br>
                    <div>
                      <div><br>
                        -- <br>
                        <div dir="ltr" data-smartmail="gmail_signature">
                          <div dir="ltr">
                            <div>
                              <div dir="ltr">
                                <div>
                                  <div dir="ltr">
                                    <div>
                                      <div dir="ltr">Davide Corrado<br>
                                        <div>UNIX Team Leader<span><br>
                                          </span></div>
                                        <div><br>
                                        </div>
                                        Via Abramo Lincoln, 25<br>
                                        20129 Milano<br>
                                        <br>
                                        Tel +39 3474259950<br>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <br>
                  <fieldset></fieldset>
                  <pre>_______________________________________________
amd-gfx mailing list
<a href="mailto:amd-gfx@lists.freedesktop.org" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C59d6be6931904c8cc54608d8b0ad907d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637453606812577161%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=WVyIYAbdsLrXtHu8TLObzx68cXuXoRkr5VPOPT6NwCQ%3D&amp;reserved=0" originalsrc="https://lists.freedesktop.org/mailman/listinfo/amd-gfx" shash="dUCYGIt3kXAe8E16EurIGXs0fdDKzoMXsDQLWsUVS2DeO9AmDFaNcHajUcma3skXU+Vc0kJnNYq9y2CKIgC2wBuMAXVa3CmT1DIHuLr4XaGXEBCToVthM3/rOZeOcI6V+/SABcqPePk1nkkykQ5DQ0UnB7+p5RIToHWdXuRQvIE=" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
                </blockquote>
                <br>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A9EC2BF4495ED165E6EBB58F--

--===============0964712595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0964712595==--
