Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A7158D2D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 12:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF3C6EE0C;
	Tue, 11 Feb 2020 11:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071DF6EE0C;
 Tue, 11 Feb 2020 11:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXnw0+YG2U8CblSt970zknrPT5pyDesNQgujImYzt6Ib55YGk412NlJZymOq9cZ1gv1sUzMl9Jdc67mDwCWVbzi1XsA64pmPwoj1oR5OdaTv/XHVnweVHc5FsDUoNBB5KccXqVjNe4A//zcUgyngdraMtVTJl27znEuC8sB50EeXPr+vfxlVYOY3osj5+J0G4z3tKTUuhCKScXnt9ozO8+Xud+MMAKK/nQwi/QuFNBz4+CZcxvnXcS3IYy5CJxxei/3qDuxrWGPLhSZ8QfGyd4M5Ls2KQidIeomupOcXpUw8RhJqjiyH0Lt4H+oMVQud61ugB3fyTm6ZKTYKl9nFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDEW6kZwEo5V+iFlDbk2SGcWTRmDxVeHUHh7KIdH26g=;
 b=FXFIwq26TnGNlypMCLk8A9a8zAYaGVGx0IU7tmyVVYPa3lW3XMxp50SJQxJVgtcyuDB6gMtcmJoR//xRFMEvD8N1qCunEAa6q4wlj72IDigjBvoeZQPbz32eb+k8YBjkACtUA/bmS8BvBZeCfzhIAW7IfFRTwxx1sVn0dVNFusFSVgq0MSsIuiJseZdte0gIZGJxNdoTqw9+B2eH8kluBLa3gAeaZNXAd8uZqg71ViJ7W8DSdjjFrY2Lm+vCd5eV8VWMyFPz+qKCF5G9efpF35Fak8FrvPaWPlsryuYt3ymESfD7y0HzssZvuz6xD1tv2BwpnFtjo5msWyd8QeWJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDEW6kZwEo5V+iFlDbk2SGcWTRmDxVeHUHh7KIdH26g=;
 b=SME4UQ7cVQ5VTA7loIRvaJhmla8eckEnjp0B5lS9TRvVooPzbq64k25HR4lM5orXkLuoRDaZrLAMnxGz1O7l4qVrJUXMQj1tPz1Cuq3RNNpWGBAshaH+bVtR5HvlRcl/3dN8zZkt9aM5Xp9+Lj/dCN28mVAAKEWvBLkob3LzY8Q=
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.101.138) by
 SN6PR12MB2688.namprd12.prod.outlook.com (52.135.103.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.24; Tue, 11 Feb 2020 11:06:53 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10%5]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 11:06:53 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: Cleanup TTMs delayed delete handling
Thread-Topic: Cleanup TTMs delayed delete handling
Thread-Index: AQHV4CQPCZC9/A8t+kaaApr3xqZ+hKgV1ixb
Date: Tue, 11 Feb 2020 11:06:53 +0000
Message-ID: <SN6PR12MB2800BAF6444C0BC373C13E9087180@SN6PR12MB2800.namprd12.prod.outlook.com>
References: <20200210150907.20616-1-christian.koenig@amd.com>
In-Reply-To: <20200210150907.20616-1-christian.koenig@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-02-11T11:05:53.7373018Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Privileged
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [101.88.214.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9bedfece-7dc6-44bd-998a-08d7aee28028
x-ms-traffictypediagnostic: SN6PR12MB2688:
x-microsoft-antispam-prvs: <SN6PR12MB2688566C150324852462783D87180@SN6PR12MB2688.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(91956017)(64756008)(66446008)(66556008)(316002)(66946007)(66476007)(76116006)(8676002)(186003)(53546011)(81156014)(26005)(81166006)(5660300002)(8936002)(110136005)(52536014)(6506007)(86362001)(4744005)(9686003)(55016002)(478600001)(2906002)(66574012)(7696005)(33656002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2688;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o/UbbdvQd5ezlfgJEnD1lYNcDeOoqPJCfjoLBdKEKUhyQZawR+fmX0NMf3NhVTtSWzkb6/MJLIjH2Co3NPWULbN6N8htf+9TR7A8iI9iIPQh/QN3rxw3B/UIv6/CRK5OwtX9Y2xfE/xTnRGZZARwj5x3nTGL933qD+NWe09rotYDjXAFm+zEEqfLBhDxzoxU6dkKUDK3s9gaQk2qUxbswAS8on9iuCjafhbhxoR7/E8GnxEDQH7dUXGtfxDZCLafh4MZSm/a4z1Xr7xfWGcpeoZAn8D4n/losVd7R8Q/Ausr0be3Du5gqlVIs89YWmiy9Dnyah1qAsF1t3GlA0VwdouzgwxCXugciPGugSKgIkC8sleRwkzsHQGlHLwzxfSaoqxPC1p48p8vsZJX4XYQS6AQOfQ+3MiKTnIm7bPmSdEMiBycyNlLcEOqkQUY/0GY
x-ms-exchange-antispam-messagedata: SmsEhll/tFU9epIgm180LDari0EFRf6JAlC1HdGE8kFILnxtQg6Awg353XZ0L2KtMbVztIbMQ93u+2ViCWkT8yZPevAlrWj5kwZJx54s2494RQfXbaLhNQOM+YJ69NH0hS4J3nGod9LzTDtuM9EOIQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bedfece-7dc6-44bd-998a-08d7aee28028
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 11:06:53.1161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PTuxvbovyvw1ZN+osCf2nEC28f15YvYC/rlOG+ytTJOfZWlP50ZfeC5bpGbiOYkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2688
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
Content-Type: multipart/mixed; boundary="===============0601632339=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0601632339==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_SN6PR12MB2800BAF6444C0BC373C13E9087180SN6PR12MB2800namp_"

--_000_SN6PR12MB2800BAF6444C0BC373C13E9087180SN6PR12MB2800namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

For patch 1/2/3/5/6
Reviewed-by: xinhui pan <xinhui.pan@amd.com>
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Monday, February 10, 2020 11:09:01 PM
To: Pan, Xinhui <Xinhui.Pan@amd.com>; amd-gfx@lists.freedesktop.org <amd-gf=
x@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.=
freedesktop.org>
Subject: Cleanup TTMs delayed delete handling

This series of patches cleans up TTMs delayed delete handling.

The core of the new handling is that we new only have a single reference co=
unter instead of two and use kref_get_unless_zero() to grab BOs from the LR=
U during eviction.

This reduces the overhead of LRU moves and allows us to properly individual=
ize the BOs reservation object during deletion to allow adding BOs for clea=
ring memory, unmapping page tables etc..

Please review and comment,
Christian.



--_000_SN6PR12MB2800BAF6444C0BC373C13E9087180SN6PR12MB2800namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
For patch 1/2/3/5/6<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
Reviewed-by: xinhui pan &lt;xinhui.pan@amd.com&gt;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Monday, February 10, 2020 11:09:01 PM<br>
<b>To:</b> Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; amd-gfx@lists.freedeskto=
p.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.or=
g &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Cleanup TTMs delayed delete handling</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This series of patches cleans up TTMs delayed dele=
te handling.<br>
<br>
The core of the new handling is that we new only have a single reference co=
unter instead of two and use kref_get_unless_zero() to grab BOs from the LR=
U during eviction.<br>
<br>
This reduces the overhead of LRU moves and allows us to properly individual=
ize the BOs reservation object during deletion to allow adding BOs for clea=
ring memory, unmapping page tables etc..<br>
<br>
Please review and comment,<br>
Christian.<br>
<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SN6PR12MB2800BAF6444C0BC373C13E9087180SN6PR12MB2800namp_--

--===============0601632339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0601632339==--
