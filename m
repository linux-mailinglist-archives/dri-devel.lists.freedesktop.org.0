Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022FB1091B2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 17:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C475089C6B;
	Mon, 25 Nov 2019 16:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690049.outbound.protection.outlook.com [40.107.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2AE89C6B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 16:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5NWuxEO93guaT+zqymY8MyUuCYMLSZHY+wOucprov9dv26sXjqd6Htx7hdmCXUM0qPSqIBzMkFyxpk7tpsQ1F2IZu70liUsh4aDT7G6g4D6T0r1iuAs+TJX7ricxTeMhC1hSj/jnucOiqGsl1/WebB7Fcf3PMg9vzmIlb1UKvOOQ+7A9z5vGJ4KYenzCHQmpQagWTMj7oK+LDrQDZ6yzJzlgzWq6PZGvO5JK3x/SpMS4Mt8zA8vjdXFcj3nm1uANyeezdLaWiHQX6k8OwQLXQ8NCvIEbwi8ngS8T6fQVc+5/Nol//zrHH6GFIoBSK8zxDBrEo4Q7d/kzMHcIdtLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URDhhb3vnhsEl8L6iYyBPClFck0uL9ZXZhQI6ECImKM=;
 b=OB8GJRwHyQQWdxvmuPJh07NVDtyWrmRgaY4RT4ntfOuXAoP28pYFOEBH7vvYKA0UZBGiPfIhR9pNhF0BUf1kMsPfxt7mEPD6o7N6iIFcl7+xYecr4+FLeOOYD++EwtZ/7Tytj2wwKPagLqjjra7V72RMv/4xEJBuSad2OVP5805wSuIwrTr3o5x1lScn9xcHqxYrdJv9Geh3a0Ip6d9mnkEhcnqm9jWXAhbt7otsnof7V2rYisiYgAAorBWjdmXK41VSCTmvLCNGYoPCDE0YhJcX+a/pwNZT4gEhMcTX/inNorKsq9pg1Uj8KPyuPOa8uwHgCYUcQTgvryH/rvLqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB4231.namprd12.prod.outlook.com (20.180.17.216) by
 CH2PR12MB4088.namprd12.prod.outlook.com (20.180.5.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18; Mon, 25 Nov 2019 16:17:15 +0000
Received: from CH2PR12MB4231.namprd12.prod.outlook.com
 ([fe80::4ced:894e:2bea:d5e4]) by CH2PR12MB4231.namprd12.prod.outlook.com
 ([fe80::4ced:894e:2bea:d5e4%7]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 16:17:15 +0000
In-Reply-To: 
From: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
Subject: drm/edid: Add modes from CTA-861-G
To: 20191123055053.154550-1-thomasanderson@google.com,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <db8b5581-effe-9828-14dd-c7655d0bd3fd@amd.com>
Date: Mon, 25 Nov 2019 11:17:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::48) To CH2PR12MB4231.namprd12.prod.outlook.com
 (2603:10b6:610:7d::24)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d2cd6a4-7a45-46ae-cd40-08d771c2ef7e
X-MS-TrafficTypeDiagnostic: CH2PR12MB4088:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4088DC339A9FABA4B6355A3CF94A0@CH2PR12MB4088.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0232B30BBC
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(189003)(199004)(16586007)(54896002)(6512007)(71190400001)(6486002)(6916009)(6436002)(2616005)(33964004)(52116002)(386003)(6506007)(26005)(186003)(14454004)(478600001)(25786009)(36756003)(86362001)(31696002)(31686004)(5000100001)(2501003)(65956001)(5660300002)(7736002)(66476007)(66556008)(66946007)(81156014)(81166006)(8936002)(8676002)(65806001)(3846002)(6116002)(66066001)(99286004)(58126008)(37036004)(316002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4088;
 H:CH2PR12MB4231.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DBkReQJu+bshXDVXemRK+G6jQOSWslr9+6VthlBuT9V9L1+6c3bOtB1acc/TUtDJIMUF1ZRrwD6sT6McsopBU6oF8trwultjXGf2OEwvPXvpZLCKxspCGNc++02zGr9aKRySImUnLRWtkw5uiVQSlD4vZHDp0+4xZA1PNgdwfZvFGwfU+Xbgt8KUZ/zWOteRpLSikzWiFWPDj7hci61lpKVDGr9K+GjkdHeloTtVKvIAGDw11NN61YsR6rp0BxsucLFUilSE4Eta2G7Tb5RHwHM9warsZTxC3O/3J+Kd6gVOTrWjiksjeZP67gZ1VeOUxaxYqoQMMYWQBmyngEqOEjbbMfw8qDXAWBxBABqBIMTIfHOkG90wTSiD20I+U9KubMesyOI19FeSOCM4tJjAJMF+bQSKpn1M5NrdRh92noBBplWnALWrOiKF+APrefAv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2cd6a4-7a45-46ae-cd40-08d771c2ef7e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 16:17:15.3346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkUdxqBKyg5HXzBuJjVgMz11KKwoBHLhXDywDFmkHiIQkBZdK1EC8V84oTd/bQv3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URDhhb3vnhsEl8L6iYyBPClFck0uL9ZXZhQI6ECImKM=;
 b=zk2e2mfKj11FXLm2PufVSKQexfQI/PTkN8WFTkxjf8F8Wc5VU42MkMX3JmRgCbi+vDGdqoDwMvSjhFIDsZbrLmSH53j0keS/6Tgi5FCR1hXfDyV4mLW5i8gAJdK1ewTWRoCSxleIkkKoz1FvjaN70Hwwr4Z3mSS9yaqOpPTwhds=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1380221703=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1380221703==
Content-Type: multipart/alternative;
 boundary="------------557EB5239F3605D4520B3C22"
Content-Language: en-US

--------------557EB5239F3605D4520B3C22
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Everything looks good. but one concern I have is that shouldn't the 
aspect ratio be 16:9 for some of them (See below). Unless I missed 
something?

VIC 109             1280x720=*16:9*
VIC 110             1680x720=*7:3*
VIC 112             1920x1080=*16:9*
VIC 116             3840x2160=*16:9*
VIC 119             3840x2160=*16:9*
VIC 120             3840x2160=*16:9*
VIC 202-209      7680x4320=*16:9*


Bhawan


--------------557EB5239F3605D4520B3C22
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Everything looks good. but one concern I have is that shouldn't
      the aspect ratio be 16:9 for some of them (See below). Unless I
      missed something?<br>
    </p>
    <p>VIC 109&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1280x720=<b>16:9</b><br>
      VIC 110&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1680x720=<b>7:3</b><br>
      VIC 112&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1920x1080=<b>16:9</b><br>
      VIC 116&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3840x2160=<b>16:9</b><br>
      VIC 119&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3840x2160=<b>16:9</b><br>
      VIC 120&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3840x2160=<b>16:9</b><br>
      VIC 202-209&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7680x4320=<b>16:9</b><br>
    </p>
    <p><br>
    </p>
    <p>Bhawan<br>
    </p>
  </body>
</html>

--------------557EB5239F3605D4520B3C22--

--===============1380221703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1380221703==--
