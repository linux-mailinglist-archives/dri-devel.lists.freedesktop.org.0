Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A4142C2A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 14:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884056E956;
	Mon, 20 Jan 2020 13:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9B16E955
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 13:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6qbdA0BP7H3DYSsE30So/slkf1JEgyCcwfmYCF3wnwdUwPY7UVVwsoyace5/NunkbpU1cW7lcnJEveO25Kqg2OuOtgy1tqkNCiX6tEiyCdb4b890Bxr0ShMVmnepxzhizjU4Ffxvz6OTM001kTX49R8mZcVa6LoIeKU/LNC5tqCjbWGq/zKjt6xGpaf9xKsaVvh2dPA3lh/DjIZQROlNeE+cjrctNrXKJzlIXl+NUdk+yV4RV1ZgFJbRedzAq0YJuXNswDwWg6L6rU5qLQaKvSOK2XcsSOPJWSksQ2w+JC4YZvbwtRKdy7chmvvbXQ2JB7A0bPMs69nd+1fltEV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=987nE8RbHLLLKoLO1CwgcMenEkr82IPyg53XnXNCA0E=;
 b=FgluY7f21DJGV43NlsKgTOthATdR6cfc9dHKFJ0Gc64PrbCv5gaHlykFz8Lu90XY2babJm66KYe7zXuwF1IXo0cmty/YfaUXGYSeki9kAx0Mhn8djr7il8pBPiy8QIrWd9eP5o2a6802VUAnisUi7hGQwa7e0vG272gOHUyGA7XGvf/xjWoomn2hSm5YsjrZ1Is+KRKN+SK0ac6GN9Hy5/s4L5Hn7IjILtBy2gF8smWaSWCCTxAHkiap4JD1NkdLM+LGItz0A2sQfkcRrrtcpKgjxamraCYTXj0Uhm7t6ckxdunSDMf9cR9lDFN75XqF+gUjRCAT1lvDq+ySzPIgzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=987nE8RbHLLLKoLO1CwgcMenEkr82IPyg53XnXNCA0E=;
 b=CsHo07eKaF7ptWAU/LB7CdfBRy8byTca9So2LoudPxDMJXwEJ5HXFvcaxFr+QCPhsNW9L22G6tWRrhEmZ6kAEzszBJqgGF0yLkvwNoShdsJSj6r+XS8WafIaAqv8+5M2Vz6DsSFB9RmxKA6AvoGMdKq7ZieDlvTXXF0yhk+oIDs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2374.namprd12.prod.outlook.com (52.132.141.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Mon, 20 Jan 2020 13:34:47 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::8dde:b52a:d97a:e89%2]) with mapi id 15.20.2644.026; Mon, 20 Jan 2020
 13:34:47 +0000
Subject: Re: [PATCH v2] drm/syncobj: Add documentation for timeline syncobj
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200114121928.251434-1-lionel.g.landwerlin@intel.com>
 <6b017f69-c798-40dc-aea6-ac6bcb3a49bf@amd.com>
 <1c286a24-5474-fdea-9993-a2b32dfdacbb@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1c65905b-dde1-c0c0-8a64-81863cc42daf@amd.com>
Date: Mon, 20 Jan 2020 14:34:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1c286a24-5474-fdea-9993-a2b32dfdacbb@intel.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:207::14)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:207::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20 via Frontend Transport; Mon, 20 Jan 2020 13:34:45 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 603a70fe-da01-42af-dd5a-08d79dad841a
X-MS-TrafficTypeDiagnostic: DM5PR12MB2374:|DM5PR12MB2374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2374B66E39395D70FA9F6E2283320@DM5PR12MB2374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-Forefront-PRVS: 0288CD37D9
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(36756003)(316002)(52116002)(54906003)(6486002)(478600001)(33964004)(81166006)(186003)(2616005)(8676002)(81156014)(8936002)(16526019)(86362001)(53546011)(6666004)(4326008)(31696002)(2906002)(31686004)(5660300002)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2374;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SH/YVMF067++Ya5jH+oRXEC9x1IigfOBHIPr4gMNFki2P6a9W/f0Rhj/dqNpBT6qKE2EMprP1LiPrO/42O3oV2sYbDCJ0q/5qszM8wrPY3puSVRcGKfZnghNODkIHsMgCjr87RrOLWxbwVJ0zt11E5yQgK29QNFkhwOccXJkyscGWtQH/YVoWUL8UWMB4JOIa52rg6ECjdEJ9RbYkZdZLSnaWXT7HLARL15zVKBczUphJqMYO0rJsZx6tHgX1M/oKOXYOkRUR3Rq30377B8h3Hi3azJ0TXu9lnEDqibWcqMxIxdz4D5heJc2JNdv5sO7cPaphbtYlf5uArZNy5vyIb/SmOjjkOBmBcrNTEUIj5C3NpQsp2I3X5R58gTwdscdMJ3v/gUomvAJCKLzgTaubE7jkdH8rlVboQx7cdpFl/3Kz5mhaCPJUgvpsVSzh0Uy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603a70fe-da01-42af-dd5a-08d79dad841a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2020 13:34:47.1778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWc38hXfh1OQsBBUkQtfUO3pXclEMeocSWRLNIDZDydHe8bMcX64r1+MKy5lTlMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2374
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============1462893034=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1462893034==
Content-Type: multipart/alternative;
 boundary="------------61EB7784DC2D98A6F2519A1E"
Content-Language: en-US

--------------61EB7784DC2D98A6F2519A1E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.01.20 um 12:02 schrieb Lionel Landwerlin:
> On 14/01/2020 16:25, Christian König wrote:
>> Am 14.01.20 um 13:19 schrieb Lionel Landwerlin:
>>> We've added a set of new APIs to manipulate syncobjs holding timelines
>>> of dma_fence. This adds a bit of documentation about how this works.
>>>
>>> v2: Small language nits (Lionel)
>>>
>>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>> Cc: Christian Koenig <Christian.Koenig@amd.com>
>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Thanks for the review Christian.
>
> Feel free to merge this commit whenever, I don't think I have commit 
> rights.
>

Done.

Christian.

>
> Cheers,
>
>
> -Lionel
>


--------------61EB7784DC2D98A6F2519A1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 20.01.20 um 12:02 schrieb Lionel
      Landwerlin:<br>
    </div>
    <blockquote type="cite" cite="mid:1c286a24-5474-fdea-9993-a2b32dfdacbb@intel.com">
      
      <div class="moz-cite-prefix">On 14/01/2020 16:25, Christian König
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:6b017f69-c798-40dc-aea6-ac6bcb3a49bf@amd.com">Am
        14.01.20 um 13:19 schrieb Lionel Landwerlin: <br>
        <blockquote type="cite" style="color: #000000;">We've added a
          set of new APIs to manipulate syncobjs holding timelines <br>
          of dma_fence. This adds a bit of documentation about how this
          works. <br>
          <br>
          v2: Small language nits (Lionel) <br>
          <br>
          Signed-off-by: Lionel Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com" moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a>
          <br>
          Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>
          <br>
          Cc: Jason Ekstrand <a class="moz-txt-link-rfc2396E" href="mailto:jason@jlekstrand.net" moz-do-not-send="true">&lt;jason@jlekstrand.net&gt;</a>
          <br>
          Cc: David(ChunMing) Zhou <a class="moz-txt-link-rfc2396E" href="mailto:David1.Zhou@amd.com" moz-do-not-send="true">&lt;David1.Zhou@amd.com&gt;</a>
          <br>
        </blockquote>
        <br>
        Reviewed-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a></blockquote>
      <p>Thanks for the review Christian.</p>
      <p>Feel free to merge this commit whenever, I don't think I have
        commit rights.</p>
    </blockquote>
    <br>
    Done.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:1c286a24-5474-fdea-9993-a2b32dfdacbb@intel.com">
      <p><br>
      </p>
      <p>Cheers,</p>
      <p><br>
      </p>
      <p>-Lionel<br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------61EB7784DC2D98A6F2519A1E--

--===============1462893034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1462893034==--
