Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEDC17B528
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 04:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F336EC5A;
	Fri,  6 Mar 2020 03:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5896EC5A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 03:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWUokUwjqrgIc12HCCYZCDxxVoYvJDsuBF5du0XyGwM=;
 b=AUmAtgKjqfuA4hhiLQIsoCnkc9u0iUNJLeboWAzRyq6I/Z8NcNR0I/3Q4jhabFCMXmHR4Vn71Uq5ynbqBJOeTiPf2F3s9hSOhafkYTNwQrPrMUHc9V8TRxoXpOW6dTSj4UaNsiuIP6C0G2xL+t7+aNhVd5I+anepfWga/8lidsY=
Received: from DB6PR0301CA0033.eurprd03.prod.outlook.com (2603:10a6:4:3e::43)
 by PR2PR08MB4699.eurprd08.prod.outlook.com (2603:10a6:101:1d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Fri, 6 Mar
 2020 03:59:44 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::5b) by DB6PR0301CA0033.outlook.office365.com
 (2603:10a6:4:3e::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.11 via Frontend
 Transport; Fri, 6 Mar 2020 03:59:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11 via Frontend Transport; Fri, 6 Mar 2020 03:59:44 +0000
Received: ("Tessian outbound efdea641ed36:v42");
 Fri, 06 Mar 2020 03:59:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16cc82a51e8e0f6a
X-CR-MTA-TID: 64aa7808
Received: from fa7379677cbc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35F4A7E6-64CC-416C-BBDA-DB50885BAA64.1; 
 Fri, 06 Mar 2020 03:59:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa7379677cbc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Mar 2020 03:59:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr3ZeqQl4A0Lys+v2yHprhZPqzSCZ3T/3Icy8JoI2m5kH4/l+C+MmgAvZIDlwCBKOCqwn3/VsYVGRf9oobwWtQYkV+2VDUCpAtD//YrVnkuA7RjxfcgUMmWAKhagbNwsPnU74vmNTCEfMKCyGt/4aTDT84VULajDrfdjMBdODzQPmEZuw2ktzFFpnnVlSX1a0N6VSZZ36ws9ohQz7F5tz4abkmA1icNM0Y3x0hq/Ic+fEM+Y7vN2gXGSblaUo44Bz/Evip9SbsaC8Y3Qw5M622VWGutnYzUBfD/DwjQe2HjBLbMJyJFr4Mwa9t99aSHZikUSlep2MTXpgKZSf+LE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWUokUwjqrgIc12HCCYZCDxxVoYvJDsuBF5du0XyGwM=;
 b=SWsJiWbthcpOSPTkAsextNolOhbmtCVnSjz/ep28dzMP5ShFALUo22iNjemATlUFEvZVRPs4y/J0ZS1wZUFXFxS03aelBj8zVKXId/ddJPAeGS1HYfzLK1cE6SqcxgioOH25sQjL2DL/7NTiJJvy/sSd/UT16OP6R0Xa9ap/NCJntL4zlHknaIgfnCpDgWyULuAdgH24yvB95wAvUmQDMPpzvGruyHpSlBfppDjO8CbcZNDmNAMD2rESFxX15Bxl+t/qm96gNAoLUGC7Dro4ZKeWTXFUfo6qUrYpoQvtr3u6K6FtioOxubqzIyD3uwm5W13LMUCiiGqKJcFPW+1rAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWUokUwjqrgIc12HCCYZCDxxVoYvJDsuBF5du0XyGwM=;
 b=AUmAtgKjqfuA4hhiLQIsoCnkc9u0iUNJLeboWAzRyq6I/Z8NcNR0I/3Q4jhabFCMXmHR4Vn71Uq5ynbqBJOeTiPf2F3s9hSOhafkYTNwQrPrMUHc9V8TRxoXpOW6dTSj4UaNsiuIP6C0G2xL+t7+aNhVd5I+anepfWga/8lidsY=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4814.eurprd08.prod.outlook.com (10.255.115.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.16; Fri, 6 Mar 2020 03:59:36 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::101d:3c1a:50cd:520%7]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 03:59:36 +0000
Date: Fri, 6 Mar 2020 11:59:30 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: drm/komeda: mark PM functions as __maybe_unused
Message-ID: <20200306035930.GA26600@jamwan02-TSP300>
References: <20200107215327.1579195-1-arnd@arndb.de>
Content-Disposition: inline
In-Reply-To: <20200107215327.1579195-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: HK2PR02CA0165.apcprd02.prod.outlook.com
 (2603:1096:201:1f::25) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (113.29.88.7) by
 HK2PR02CA0165.apcprd02.prod.outlook.com (2603:1096:201:1f::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Fri, 6 Mar 2020 03:59:35 +0000
X-Originating-IP: [113.29.88.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d004d5fc-4d68-4c1c-0e3e-08d7c182ce35
X-MS-TrafficTypeDiagnostic: VE1PR08MB4814:|VE1PR08MB4814:|PR2PR08MB4699:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PR2PR08MB469984642F27026CE5E64016B3E30@PR2PR08MB4699.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-Forefront-PRVS: 0334223192
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(5660300002)(81166006)(81156014)(55236004)(26005)(9686003)(8676002)(6666004)(956004)(1076003)(54906003)(6916009)(66556008)(316002)(16526019)(66946007)(66476007)(186003)(86362001)(33716001)(52116002)(2906002)(6496006)(6486002)(33656002)(8936002)(4326008)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4814;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +dnSL4REssuZvLx1smuXN8Sk197dY/x/2DtHoVWjNbDtOrJc1yO9778sIOCTtCe4b0ufeAgp1YcF4TbqKZDi6WM0JgHuUPAH3rY3BEPiiQI3gzG5n6j/z1WI8xuVL1EMgIJvmqsufzL75BPM5q6Zrk6KoOrR/H8Xn1gr23hhnn/wLfoZH7rNGLW6GdF/Yv4kdrFCWkoWou4/18MaAnBYWCtEMzu3sW1ve35894a5/OPd2dUCQG14AuPzap5ZwgGQZP/aUv3YU8tF+lPIvznxVPgoJ2K99tPXzCtmlmEp5SwZqspWyjvWaBklc8AKBoK35Oz2cU8fAwXpJT5HdFNAVZrQBJ9cAq8pn90xddgocHOz5XSGr6Uuc9T27Ylpa7YgjxoQpzpOI6Qj+UasfR2y47/30/cnf9PNrmooYXoLALo0itWCAqF4v8xmramuqYyd
X-MS-Exchange-AntiSpam-MessageData: w1rYufDA6N5evi6VgGfQA05+pl9VSNxbvRhI/sonSfM9gxlvqoZInvVJ+N0I7dVqzxEDtbkAi1gxQG9tc5fqa/2dG96AwnfBiVjpqcn2V5691VUQsB1xyrRJIA+5pfYHkXVmAoOgKFGZ9XWYyDnmSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4814
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(346002)(39860400002)(376002)(199004)(189003)(8676002)(81166006)(81156014)(70586007)(16526019)(70206006)(1076003)(186003)(8936002)(336012)(5660300002)(4326008)(86362001)(33656002)(26005)(956004)(33716001)(6862004)(316002)(356004)(478600001)(6666004)(9686003)(6496006)(26826003)(54906003)(2906002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4699;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bbf58db3-1066-4c9c-f440-08d7c182c94b
X-Forefront-PRVS: 0334223192
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J66r1SU21PRdiKUSR0Dh5Rlng87JTLZR8hjoL2p32mMMN3K9ASJnbed8Dd+yQ//09wUdltZt1sVToB8g3dzSJojoTF7zju68A+1OKQtCZGC4qsA9px5y6G+peXYITY4Qi68QW477qlweedubRhdUYK4zlHPpelUEzyrioMPqa6RL7wBkWNpk2NiAwmB4LolCB5x94k4NNOYKzWGRVNJRyjqMu0iRJjMOlN13cDbtfkkD69BfIAtWaJN1NibF6lcFd55L3FPtYvC7wJV8XHZYr72/KicMYn087SmlHG386Xi6EXi+Vnp/sXb3gHUimLeTkJ/hZbJGaTwIsUrZHRM68Ed6gRWTzStcFtdpT1W0w20wwc6am9KRmsYSMTFsGRucrNg9b6TcXeqC7iZQobTGJSIn27bMzxyBWGEkDU1VcbvBUB1LLUI1xuSdD6pwsp5W
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2020 03:59:44.5387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d004d5fc-4d68-4c1c-0e3e-08d7c182ce35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4699
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
Cc: nd@arm.com, "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 07, 2020 at 10:53:19PM +0100, Arnd Bergmann wrote:
> Without this, we get a couple of warnings when CONFIG_PM
> is disabled:
> 
> drivers/gpu/drm/arm/display/komeda/komeda_drv.c:156:12: error: 'komeda_rt_pm_resume' defined but not used [-Werror=unused-function]
>  static int komeda_rt_pm_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/arm/display/komeda/komeda_drv.c:149:12: error: 'komeda_rt_pm_suspend' defined but not used [-Werror=unused-function]
>  static int komeda_rt_pm_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes: efb465088518 ("drm/komeda: Add runtime_pm support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index ea5cd1e17304..e7933930a657 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -146,14 +146,14 @@ static const struct of_device_id komeda_of_match[] = {
>  
>  MODULE_DEVICE_TABLE(of, komeda_of_match);
>  
> -static int komeda_rt_pm_suspend(struct device *dev)
> +static int __maybe_unused komeda_rt_pm_suspend(struct device *dev)
>  {
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
>  
>  	return komeda_dev_suspend(mdrv->mdev);
>  }
>  
> -static int komeda_rt_pm_resume(struct device *dev)
> +static int __maybe_unused komeda_rt_pm_resume(struct device *dev)
>  {
>  	struct komeda_drv *mdrv = dev_get_drvdata(dev);
>

Applied to drm-misc-fixes 9803aac7b5508718989e4cde11b854fc01037b01
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
