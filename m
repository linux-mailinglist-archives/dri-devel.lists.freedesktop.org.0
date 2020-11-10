Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D82ADD7A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 18:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7471889A62;
	Tue, 10 Nov 2020 17:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29E898A3;
 Tue, 10 Nov 2020 17:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXUTUxO0ssV9cjluf/W+j847nR+IEyHW9EbVZCr7gp5XBtASUdbppPK5mQTPml74YsNwoSeKWCvSDdleqm6yY8/X2pHy1ofj33vq6jHaKsWbJnQ/3MouEK6vJQcjTu//cTmH043dHFhdkBcT9UVd/PsQn40QB09wz89zU7K0ZA+2rQ/M417gJn9Gov1RuQ14V8+1SjeQuDKkqS4viCBtNP6tIYffL949SUVruN6t3B3r6W+rpjGtFWYk4dAZChwwg2O1VND9PcehqSBTn4y7/8NOSIgtIAA7Er0pZ+SoD6F8sm/4QzDzvtAPC0Ja0jAZMN1+TQSHFpCZ0zzFMN97vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvTvtagcGkSi1kbBKpXY9Y0F9MvjlQ8xiWSam7ejYbA=;
 b=UIaghE7mu4mtwcdToaOsbqZbxaxreiL9fZwJNNvBG+4sXgjOzvKHmhgLVjkc8acxlln8E3ZC13ECJsyMNqVJG+cTBqUInAVeXeaq+QaGBKt3zfobd1zaFdbc4SZ9NgJC+C1GH1r0w6d4whZBAlqNYWieDBTFeubsIrJzY+i/lXMLOMIGNvqZkXvKw9jIhP9VDUgSxfPCzepwQaQ2oilSg+6BNNIy5iE+Ywmldx60j0rYy5/n8ywDZvCLaHJrfVJwAzpqm2jrBdd8baboEhjGODtC/N28FMV37eequ2xkAnS970BqwxkLTJ9kqpV7Ms0RWoXQInc4/CWNVztrRAVl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvTvtagcGkSi1kbBKpXY9Y0F9MvjlQ8xiWSam7ejYbA=;
 b=RaKuH3Icp+NEBCQzV18Tw+qdwYwWEWsB/zAWmr2sq9/PsQMgJa/FU3KvBAWmgMP9IKMriKrRHGb3QVi6ZCh7PVxR3JHW0Vy/zeYCDtc4vNX+CicDRsEMklsXpfyo2i3ZZGfDuLQPNoxN5524nZitKB+vnV0OzO1grKNtIMk2hqA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4578.namprd12.prod.outlook.com (2603:10b6:5:2a9::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Tue, 10 Nov 2020 17:54:23 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.021; Tue, 10 Nov 2020
 17:54:23 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
 <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com>
Date: Tue, 10 Nov 2020 12:54:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200624061153.GA933050@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:757a:f239:6b01:6396]
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:757a:f239:6b01:6396]
 (2607:fea8:3edf:49b0:757a:f239:6b01:6396) by
 YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 17:54:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f245fa1-e06b-498c-2e6d-08d885a1a85c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4578:
X-Microsoft-Antispam-PRVS: <DM6PR12MB457870EE04B4F8195249E906EAE90@DM6PR12MB4578.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J7UrnQBpQbDH2XylefVyOcSOsAF7+0bR+n+s890r0KqDvIA4JZDTLgnlI9ngKfx/qqBf/l9hL7/HPtx6MqJSwN5AexKxGTO5W54hNsRsc1nLelzPUva4AptFI1dM3EIi6+82C2FFRpiGaz4fur5GhI5wygQ/H2LXLOfNfO6rQYuTO8xJZYvwIKcIEMJvv/w318Gm/KZ7xSx+tmOXqjzeSdIi+DfCm8WiWUgeipsxAzv6E+3uw3Rc3RFPAIcUsrQ+uIP2ZzgRW4UHUnr68jacrEoqRoJD90+UER5bm90oaNwHMfjofm66IZWQnU40Dwo7oemXMGfiabl1dM6u73vLRCRrKE9jR7C1S7xfMHDrLQ5lLO/xVcETwegRWLvGXPuhLRlX4yElbfy0jtNeKLoDDgHq60VLk5B0d+DlZ8pXpzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(5660300002)(8936002)(4326008)(66476007)(86362001)(52116002)(966005)(8676002)(2906002)(316002)(166002)(66946007)(36756003)(66556008)(6916009)(2616005)(33964004)(16526019)(31686004)(6486002)(186003)(478600001)(53546011)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGNVaU9FWlFYeGVTbkUremFRdGhvczVnSlpaSmYxcTJEQ2hWZE9wR2NqZFk3?=
 =?utf-8?B?YWFVRTBXL1pXTFllMEhSS3R4bUdxelE3eU1yRDk0SHJkN0NBMDVwblhOY2Q4?=
 =?utf-8?B?SnpibHFQRkt5QTZGMWIrQU1SaUV6S21nb3AvRjlRUlpOUmtQMVhIL2pzZ2gz?=
 =?utf-8?B?STdtSlFUTjFhK1NwV1NQNlhudHVCTHpHSktXUXdXOUhocW85RnRqQmM5cDFu?=
 =?utf-8?B?T0U2NG5RaHQrUkNWeVFKNHM4YzhZc2o5bmNZb1NyRXZsOWVzYUx5ZDlmdDdP?=
 =?utf-8?B?NTRDbUp5S01QNlVNNGx6U0tWMUoxQUl4ZUF4ZGNWb3FzOVE2T3l6SVpFb0Nr?=
 =?utf-8?B?RlBFTm1PdzFEc0huZzA2aThBS2c4dXRUcHE2T1ZSRFhVTmdXckN5N3ZYRzh0?=
 =?utf-8?B?eXhwbDZ1K0RWdk5MSnA0MGE4R1RpbUlPSVJ6Y2dZQk9HcHFXMHppSVlVTCtF?=
 =?utf-8?B?MXVrRVpUM2NGQU9vU0UycnRXc0dKSEtHb1ZkT3Q3anZ1VlJvNjdadDhiS2Nx?=
 =?utf-8?B?WnBuemplZDJaVUZqWllBZm1DemlFZjNxWlJvMHJxMWhlL2pBQXp0bEM5NzJs?=
 =?utf-8?B?YkhsWDZ0VU5Rbmo1Yk9tcGd0aFFGb3N0TmZqT3ZSeVBZbHBiSWY2MEMyVXk2?=
 =?utf-8?B?OEhXVG1RM2VjdFJBcFkycGY1RFY2UlZZK0F6bHBCZk9jL1laeFMyRWREUkxi?=
 =?utf-8?B?RVVPZDZzVWo2OUhwL1I2S0dzZkE1WXFON2xudEdpUnN2T2IzZ2tyMUJqU0sx?=
 =?utf-8?B?M2w3SVhnYjZEVUVSN01QTEY2ckptd0JIamFtMlhhV3U0VmZydU5aQWJmVVRR?=
 =?utf-8?B?L0YvZ3ZQQzNDTmZVbkpDUWUxOVFLZG1JRklPKzhtMzdJb2R4R1lwZG9NYUpI?=
 =?utf-8?B?WmgydG1rVjNjR2FMdFg3cnc1bDZMV2dnMnNlQVpFZ2tCa2I1MmJBUk1GMWhs?=
 =?utf-8?B?WVF3c2xyWkRmMWh1bUszUkdhMnYrNmxFMDR2SnZmdVZIZmRkd093MTB4WjV4?=
 =?utf-8?B?MjY5OE9qTlhodHcrV3A5RjF5RDZ0RXo3OXh2TjlQbDJYNHMzSXN6RVFqNW5i?=
 =?utf-8?B?WVdpRjVMT1VLaERXU3dqa3U0TnNxemsvcStEa0w2WnRDRnNBQUVHcm56Ulhv?=
 =?utf-8?B?UGpFNktkR1g1cEV3M2VJbmhRYmlXald4dWVwQytqaUhoVDNzNlNMeGtCU1Bl?=
 =?utf-8?B?UVNhd1JGSXNXUjB5cFFYSkg5ZXpRVVFOOTdYTE9WaGNnWFV1cDdpOFBGUnox?=
 =?utf-8?B?dUtHcmpCUytRWXp4Um92LzNwcXZySW9JemlMTmRjOUFDVDVKdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f245fa1-e06b-498c-2e6d-08d885a1a85c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 17:54:23.5161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Faq/tu02K3f9pStN4PmpHDP2Gw2L4tefQNzWCXFokrGg8OyIXdMv8nQUnFx2zk9J/WD/X8r0wBR+xTqE/CRdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4578
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: multipart/mixed; boundary="===============1803544489=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1803544489==
Content-Type: multipart/alternative;
 boundary="------------9B0C735053E2719B7A5EBAB3"
Content-Language: en-US

--------------9B0C735053E2719B7A5EBAB3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, back to this after a long context switch for some higher priority stuff.

So here I was able eventually to drop all this code and this change here 
https://cgit.freedesktop.org/~agrodzov/linux/commit/?h=amd-staging-drm-next-device-unplug&id=61852c8a59b4dd89d637693552c73175b9f2ccd6
was enough for me. Seems like while device_remove_file can handle the use case 
where the file and the parent directory already gone, sysfs_remove_group goes 
down in flames in that case
due to kobj->sd being unset on device removal.

Andrey

On 6/24/20 2:11 AM, Greg KH wrote:
>>> But why are things being removed twice?
>> Not sure I understand what removed twice ? I remove only once per sysfs attribute.
> This code path shows that the kernel is trying to remove a file that is
> not present, so someone removed it already...
>
> thanks,
>
> gre k-h
>

--------------9B0C735053E2719B7A5EBAB3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi, back to this after a long context switch for some higher
      priority stuff. <br>
    </p>
    <p>So here I was able eventually to drop all this code and this
      change here
<a class="moz-txt-link-freetext" href="https://cgit.freedesktop.org/~agrodzov/linux/commit/?h=amd-staging-drm-next-device-unplug&amp;id=61852c8a59b4dd89d637693552c73175b9f2ccd6">https://cgit.freedesktop.org/~agrodzov/linux/commit/?h=amd-staging-drm-next-device-unplug&amp;id=61852c8a59b4dd89d637693552c73175b9f2ccd6</a><br>
      was enough for me. Seems like while device_remove_file can handle
      the use case where the file and the parent directory already gone,
      sysfs_remove_group goes down in flames in that case<br>
      due to <font size="+3"><span style="color: rgb(51, 51, 51); font-family: monospace; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; white-space: pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">kobj-&gt;sd being unset on device removal</span></font>.<br>
    </p>
    <p>Andrey<br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 2:11 AM, Greg KH wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624061153.GA933050@kroah.com">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">But why are things being removed twice?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Not sure I understand what removed twice ? I remove only once per sysfs attribute.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This code path shows that the kernel is trying to remove a file that is
not present, so someone removed it already...

thanks,

gre k-h

</pre>
    </blockquote>
  </body>
</html>

--------------9B0C735053E2719B7A5EBAB3--

--===============1803544489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1803544489==--
