Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83C6BE66F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 11:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A642310EEC9;
	Fri, 17 Mar 2023 10:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6956F10EEC8;
 Fri, 17 Mar 2023 10:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679048362;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tT7Ce7upw5VusgDKpvjwrLHvRjZPQStveDGaaAzbcsw=;
 b=Y8Zskiz8FNrtsUJ3fA8Ynh3vYjED7yoK11A9BH3DAnJLgsLX1z91WclM
 Qqyf4a3B8k3futJNUJQusgIfHH19+tnlhgd6HVkfJPQ5R7aAXQKqO2MOG
 625XHCLKprRapxUSpkESwSakWSRJCQcJLoZ1sN+W8xw5sOlJ6freXkajd I=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 100051943
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:R48UGqj7qCZeBOFzUAWF6HVfX161yBAKZh0ujC45NGQN5FlHY01je
 htvXG6BbvrYMDPyL94nOdm38k1T6sXVn4BkGgA9+XowRX8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQTFGoOdEmt39mEg7SJTMhm2+F8L+3kadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGybLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjANpPTezkrZaGhnW1xGs6UC86UGeKnrq3k3OZffJja
 GkLr39GQa8asRbDosPGdwajvHeOsxoYWtxRO+438geAzuzT+QnxLmIDVD9aLts9qNUxWycpx
 3eOhdriATEpu7qQIVqN+7HRoT6sNCw9KW4ZeTRCXQYD+8Pkoow4klTIVNkLOKexg838Hz392
 XaGoTU1h7gJpccO2+Ow+lWvqzixvIrASgk54Rredm2g5wJ9IoWiYuSAy1nC7P9Gaq2ZQ1+pt
 X0I3cOZ6YgmF5ic0iyQSeMCNLis67CONzi0qVlrEpo6/jKh4Um/bJtQ6zFzIkRuGssccDqva
 0jW0Stq+JJMNWG2K492Z468Ad4jy6TIHNHpEPvTa7JmZpl3aR/C/yx0Y0OU937inVJqkqwlP
 5qfN8G2Ah4yBb5miTa7WeoZ+bsq3Twlg23JSJ33wg+kzb2GInmPRt8tOV6CK+83/IuAoR7J6
 JBRLcaHxxhEU/H5em/Q64F7BVANK3c/CJGv7cxKf+iMCgNjFCcqDPq56bErdpFhnq9VvvzV5
 Xz7UUhdoHL2gXDXJQiXYXBucpvgWJ9+qTQwOilEFVSnwX84eq608bwSMZAweNEP9vFnzPcyX
 fkMfcqoC/FDDD/A/lw1ZpnnrZd+dR2twwGJMiykbxA2epImTAvMkuIIZSPq/SgKSyay6803p
 uT60huBGMVfAQN/EMzRdfSjiUurumQQk/5zWE2OJcRPfELr885hLCmZYuILHvzg4C7rnlOyv
 zt6yz9CzQURi+fZKOX0uJ0=
IronPort-HdrOrdr: A9a23:rJlYmqFmvwIMCSJppLqFtpHXdLJyesId70hD6qkoc20sTiSZ//
 rPoB1p726OtN9xYgBWpTnkAsO9qBznhPpICOUqU4tKGTOWwVdAT7sSm7cKoQeQfBEWn9Q1vc
 wMH8dD4Z/LfD5HZK3BkWqF+qMbsby6GdeT9IXjJhlWLD2CIJsQlTuRQjzrb3FedU1+Hpw+G4
 Ob5s1b4xSdWVl/VLXyOlA1G9HZodvFjZTnZgNDISUGxk2hsROEgYSKWiRw8C1uLw+mm9oZgB
 f4ey+V3NTcjxn6pyWsp1M6oflt6ajcIpUoPr35tiCmRw+c+zqAdcB9X7WZsHQvrPuy7UtCqq
 i/nz4we9l242ncOn64ugHs3Q6I6kda10Pf
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; d="scan'208";a="100051943"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 06:19:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Traaexq6tH8oIH3Iqyf/fT8g02KfHDVv2sJk2Ba7ABEWL01LCLc3p5sBtBnzy2iYOfhFqJHkMwYWVcmYZveTssfTiSw6v8A7sHi4rFw/7UCuIwMjBcPr+WHg6tkU9f3XxcmmIhOGw++mwR1YKtx8q4cnZAHm9VDO0f4QY+5vljqi4sIxUSe8bjvbtV6zuO/07O3WG3jhI3d/VhnRs3+TTveSmmWzBQC0kTNU66QR5zYOhruhXTXJP6CmnjZOYybz+sVX4b0TYJiyKu2TgCanO7cVRYy6x85JAnZ6GjtRlKIuv5AFnQe0sGNCiDL0C//Tt8Yvfwl+QjrfIPT20qe5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrwZFrlOOl7QipG+6ZRLOoT0wnO0FQRw1VdZC4Q0T+I=;
 b=P1b2x6cPompfdfIZ2+PIlnw1hNuc3Ebf2gJ+grzDV8KzwGTkP+eNEOdgRG4fZUAS7T9Pdfb8TSoQfwfHzQ9pO33i4fC/ex6ZABA0B1DFxkbNl8lz4erBVLhzy3kUrvvHE/edSG5F15ymRjQj2rCvAOaAD7oRKWTuStuzavI5BaLQd+Y2qT6RSe61KSY5Qp2JQ2ra3AuZ+mGEmpjyglrfQNSWNqRUfIQvFu+/VTTYN9JLXk/EZ1JMyMOnNLqVlGBgqvuj9OTiwHAm+tct+dmZxhEh5xuAkDu2vkkEYigJoqybD1n7DwdSIm+pVQD8v9J7+WR+KJo9Dkd7BTLST6cDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrwZFrlOOl7QipG+6ZRLOoT0wnO0FQRw1VdZC4Q0T+I=;
 b=Z6Mss/1eXiEX6pklfM5mJErD2AfdxYlcRp9ezGOWSElCOIJFIrR9nGEtuBOmp90E7oAQIvrg3kPaEwpM4aktXMzbWpHKgm519X+AmVq3Ct9+BtUKSjF0tR2JVT7O5sfpQCfEwrXdi64kzmiWdBuk5Uc45iQKFpM7Rzmyj3fcA+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY1PR03MB7263.namprd03.prod.outlook.com (2603:10b6:a03:529::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Fri, 17 Mar
 2023 10:19:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 10:19:08 +0000
Date: Fri, 17 Mar 2023 11:19:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 1/5] x86/xen: disable swiotlb for xen pvh
Message-ID: <ZBQ+ltOYNqCC0ysK@Air-de-Roger>
References: <ea0e3852-87ba-984b-4010-5eeac3d6c507@suse.com>
 <alpine.DEB.2.22.394.2303141747350.863724@ubuntu-linux-20-04-desktop>
 <f5e03f2a-8176-528f-e885-9a97940367c0@suse.com>
 <alpine.DEB.2.22.394.2303151616200.3462@ubuntu-linux-20-04-desktop>
 <5e22a45d-6f12-da9b-94f6-3112a30e8574@suse.com>
 <CADnq5_PH9ZqDqpPES74V3fB3NVpaexDoGTyu_+-zoux5vgagyg@mail.gmail.com>
 <dcb54275-b21f-a837-76bb-e19e331a0666@suse.com>
 <CADnq5_PpCWrZzQdE_X6ZnuNU3ktVeC6TbmE5vq3K6rCAdB8GTg@mail.gmail.com>
 <d256a967-f50e-2e19-1985-aa9cfc0e8b18@suse.com>
 <alpine.DEB.2.22.394.2303161603200.3359@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2303161603200.3359@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO2P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY1PR03MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbc73c0-c135-4bea-58cd-08db26d10afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1miLwLHSsut1yA8hsMLXx8ocKd0bxvkTrsdVnkF7C+1mz89BuJkBbe5dQSp8c8C1VuyStFw1nwSmj+CrzT7DaE9tFBjikMwiEfJY3zDbvd7ppeYa8DKo3XsD3oQ+Dl3yp7Vc7S4OTLMFEnMd3G4EUuGjXCGX0lrDB1CSkRApfyMPG5exbcOlkRYHjE8nwv8xhlaDrsHBL/bttG5LZqIED//FPJhQ+aYy69LFK5Q3QufuNHIRASf/JiUz5sjClgpNxftZ1UhfW7mQQOsi0sMK5a0BqVy4OJ/EXv39SnBjQMOIa4Vj8azFOOOYBv22zOGDaoQNsDjnQrUsbLk58bQisO4xWHJ6PVmNSkU9FREYoX8yLEyYsudi41HbEJ7tU6j34MmjuB7tC4OTLPUhiCdXxqHiIefkuhkOZ6VZt628FJq3izxbpIbuzUhe7dAeDBcw9e/O/EhSfX2tUTJBUNgRvysZ8MlECO2+wCvV/wOhiVpn7QoSJxE0O1TNuFYCuWnLtncos2GaTW+lXbZN3myLc7c+Xx4NFFNbPS8FT9/bLavzU6lMKHlLN4MIkWnUQxg4f62AFIzfORImUvipjQJYrn34Z6NrKFxnGCZUvzvwPNXqvuDt+qCLeZ+Jl08Svm8+AAQkBrrJ0r+CksLBfFTQRnsOi6uQ70ImUuOl/I4RXuHUMimJ0JRfL4U+0+IwHLR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6360.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(7916004)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199018)(38100700002)(86362001)(85182001)(82960400001)(478600001)(8936002)(41300700001)(7416002)(2906002)(5660300002)(33716001)(4326008)(26005)(9686003)(6506007)(83380400001)(6512007)(53546011)(316002)(186003)(8676002)(6666004)(66476007)(66556008)(6486002)(54906003)(6916009)(66946007)(66899018)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndaQ0xVQnpoeVJ1SE5qYytGN2Z5OFAxbzFTM3BaT05ONm52VHRtaDBnVEVN?=
 =?utf-8?B?WVhLTDErUWZMNGNXTktoZEtLNCtVWUFLMURaNXIxTzRPRkZJcmszYURCTTFK?=
 =?utf-8?B?bHBUR0hJVTlNa1JlR3BpZjFEZkwwL3FBN3FwZW9FSFhwOTJQM3p0U3F3VEl6?=
 =?utf-8?B?QXMzOU9vekpuZmRmL0V6cE45WTNQVzVwSXlTMTNrYXBUUDJtNFdWZkcxVWZP?=
 =?utf-8?B?cUxxcVNwU05CSUVQZ3lXY241c2tMVTEyRWY1TlVRZndrc0FneU1CSEcxMG5S?=
 =?utf-8?B?SUdSclNnb0dBbzVScm93Q1V5TWE1TE9ZMjg2MFF5ZXFsK2VNL3JJQ0tGL09i?=
 =?utf-8?B?L0tZY293NjJNa3lQTm5nS0pZMS9tWFFkcG0vQ3c5ekxuUHZzeDFOM2dJNGRL?=
 =?utf-8?B?U2NmOVlqajd5KzJIYytsdS9VckY2Qmg5ZWR0NnM5VGRjZGtaNkFhNTZUejB2?=
 =?utf-8?B?WFB0R2RDeDJzcGlrN2NIWGdnRVcxV2NtbnB4UlZta1dzWXZHdGlWekVwZ2pN?=
 =?utf-8?B?NnBKdXowS1MyWGxYK1dISTI3M0tKeU53TU0zL0dYNG84YmV6Rmp6V2pLdFhi?=
 =?utf-8?B?RnhrTHpCUjE4ZWtvYk9pRGEzNFhHckVDTGVSRXE1eDV4VTJTeHZPMTJ6WHgz?=
 =?utf-8?B?THV0dlRxc1lmajlOUkhhTEpzYThLSGM2dDYwM3F5dTBqYTZEOS9FOStWcnRD?=
 =?utf-8?B?b0RhWTlQOFBxK1R4eVVkNmVOYnV1NWhSQk1KY1I5eEdIVWpaWEFFZ2N0N1Zq?=
 =?utf-8?B?dlQ2YWQzMEs2TzNzYzBZQWYwR3U0SFEzNDhUUWpGcDBsdlVFV3BhaTBrcEFX?=
 =?utf-8?B?TW9MOTJpTTNOUDRjS2NvZEpVSXNBL1E2Sjlwb3dlSURTdWlHZVYzd3FZbUdw?=
 =?utf-8?B?bXNiTjY4YXlaOWExOGVia3hlTm5YRWd5U3dSSW1mbUZwcGFzSmRWWDBscnZY?=
 =?utf-8?B?Y3BDSzVVYUFJOWRCUWhyZ2tHQlY1eXdsMy9nQzFLSTJzcXdlVTZqU2pMQnVV?=
 =?utf-8?B?YWJ1aGx6dVluT0Z0WjRneTVYaDYwblNYZDViVEk3akZnSW9BakVia1lIRGFF?=
 =?utf-8?B?WERTU2NTS21mT0sySm9MNFVrVnpJRHcxRTRKQ2hEeDZ3b25CZE1VckpNaG51?=
 =?utf-8?B?TVpjOFFQZDZMTHdMNHNHVkUwNEZ1TnUxYndSR21nZ21zZlpwRmg0SEVCSjYw?=
 =?utf-8?B?ckhlUTZ0d3pvNlpwdHZ3Z3MwaDFlNktkNWJEK0dCS0dtRDQrdU5EaWF1eWx3?=
 =?utf-8?B?ZmttaUVaQkVQbkI1YzVCRHZvRDNReGlKSHRJbkZjSmRTZUFqY1crRVZDSVg3?=
 =?utf-8?B?dHpBeEtLSXBiSmtlL251cnNpR2MwS2JRbW1oa1NIdHN6blZLRUpmSFZwVk5r?=
 =?utf-8?B?Zm9sTXZlR1VjclV4di9PTmlrU2FsU1NpUVRab212bE9WaFcwTVRGem45bUN4?=
 =?utf-8?B?VnpySkZnck1qb2hybmNwdXZqVFdwblZIemJ0WFdxTExlVHhlTHJuc3RNRmo4?=
 =?utf-8?B?eGE4NmwzZEVFYUY5WHQzdXZpZmlKRWdsa2ozRWUyRlZEWTFWdEp6Tm5jWnRP?=
 =?utf-8?B?aU5IR2RsUTFFSFJGczUrUDkyYkFST05xa0VoQTZVME5IT1l0VDd2SzIxUTNM?=
 =?utf-8?B?dUt5Sys5Y2hHQjNieUJ3dUZMR01MSFU1YS9LTmJHV25hS0JpMGZWN2ZqbUR2?=
 =?utf-8?B?TU1YWDhlY2VWbjRLcGJReGFucXNsRjQrdjZUWWc2TDZralhhWWtYMGJKV1dz?=
 =?utf-8?B?VEtER1pDRHZyVDBHckNJRk1IblZMUUtJOXZqZHRoNEtlNWtlTUhlWnJkWXpr?=
 =?utf-8?B?d1NoTE9XcmxoREJwaTRIcXU4dnY1OHJ3THovZE8rWkZubEJ4M1QraDNtRGs3?=
 =?utf-8?B?KzVrWGZOTVZHZDJXSGRzYldGYnFjSE1velpFQXUxOFIvWGJ0QmhvVGx5RU9F?=
 =?utf-8?B?cXIyQ1RBa2VXSEV0RWVGRHY2djdic3Y2TWszSUl6THVmTWpEZ2cvL1loS0Qz?=
 =?utf-8?B?ZEI0QmlZRGZ4Y2JxeUY4VS93YzhpbkNEcGJNVHlPN25pRHJQZGhMRGtuQkFD?=
 =?utf-8?B?c3Z6bjBML3RiZTMvK3VFcnpMdWFGQ2N6eTltakY4aDdHdWZBd2VEZ213c01s?=
 =?utf-8?B?WTZaME0vRllsbUc4cTN3RlpPSzkrV21oWkRHbnFMUVVPQTNxSG5oeXdyVTI0?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?RG9QdFRYMTFQVXRJbU5MekVKLzArMERHMU0rd1BxdjhiMkM5YnlGeVBZWkNS?=
 =?utf-8?B?TnNBRUhoMnpQd3BLbG14MWhkNTg4KzhrcmNlK2dkbjFNTENibTBlYXUrVllH?=
 =?utf-8?B?Ri91OWlYQWNUY3ZKSnNLOXFWejg3eERpMnJHcC9WbGZHN1ZrSFhzdndrVTJ3?=
 =?utf-8?B?bVZKVHRvMFI3UVVZNkxCbkdKNmhBZ0pZZktZckpuWk5mRkUwYkFUMTA2dzJQ?=
 =?utf-8?B?K0ZCZVhOa203SENESVRTampTK1hNbGZBaXpJeVhacXZRbnlaUWVkdkI0cTA4?=
 =?utf-8?B?cWxUcWo4TkJKZ1NIOHBjeDhna0psTzM3ZnUyQ29wN25CODAxc3JZaFJwcTVN?=
 =?utf-8?B?N2ZmbDBJSUlOVzZtWjhmUFNxeEpieStIcVhlR25PRkFkeGZWeXB5SjBiL0FY?=
 =?utf-8?B?TWIzWW1MZkkycGlYMVpoUTJ1M1RZZzJtZDIwK0szdEJDQ2FkVWRwWWJUZkhU?=
 =?utf-8?B?WGNrLytPM0V0ZjJJZzlLNlpRSTlEckFQWU5vLzVmb25weUVLaHlGNzAyMVFU?=
 =?utf-8?B?WjBNVUNzcFhnU0gyajBadTJURG5CKzh5VnVML0dtL09TUTVQZW9RM3J5aitr?=
 =?utf-8?B?TFp2VHdDQndrRmZBTGJ0VmxsallBSVRIQUlNRDZ5NW9FVlVaWWtWa05PK2FC?=
 =?utf-8?B?dm4zN3ZoTzFMSDBtUERxN3dkcjFJZGh4cE94dEVYQWdPRHpiYTVHZys1S2ha?=
 =?utf-8?B?MHBYeVdOWTFyRFgzSEdRbFAvUTYwcllxZ2poRWR2K05Pdm94MVRVQmVqck1n?=
 =?utf-8?B?c1dBUnI1NHVTQktyMUVBUVRCL3loQjBxWlpCUHNEZWhVbWlHMGhVb015ZTF6?=
 =?utf-8?B?UzBBWE1DMzdjL0lBWk94NzBHUmxNK0pqeWJkYXJXWVBYN1lzazYvaldoWFo2?=
 =?utf-8?B?RHlSeEV5dklEOHZHdXBjbFZwd0xOQkhDeW44ZDMwdXpRVThsOXhJMWNoOEw0?=
 =?utf-8?B?UzFHZDYwaGRpczdjVm9CcTg1MFpxUHVjNE9iekl1dkhXdUdFZHpPSmx0a0My?=
 =?utf-8?B?TDREUFYvN1NFMWtVQzNqdDMvYUE0Yk5aWm9peVJoNHdITEp5Y21JaW5aa2la?=
 =?utf-8?B?SDZpQko1bUZPM0xTZ0hrWE1Qd08zUXVqbmgwbTljbW82d09EMmpCUUVhN2la?=
 =?utf-8?B?WG9DQ3hQaVlEekpkVlhLZC8xd3FuS1phTGUyVWY3ZU9MZVJhMTV4ak53MTJp?=
 =?utf-8?B?VzFqaUN2QmZ3ZXBualp3K3lzdkRiYTdYN0xOTy85TEkvOU1CckNvMjU0KzJF?=
 =?utf-8?B?cWFyZDkwRDQzanRpb0lsa0hjYjUwTG1DQm1BdHIxNXcyR0VOdVRlUkY3ZGpU?=
 =?utf-8?B?eW5CNE1MMG5BYUZ0RGRnZnJmWVNwRDNoSHUxMFlYK25lVWR6akZPTFJrWU42?=
 =?utf-8?Q?IO0wQBV1NlQGqaRWl6ZDTxxzB4yAeOps=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbc73c0-c135-4bea-58cd-08db26d10afe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 10:19:07.9705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3EI2G5WU380MpQw5OKXGCLdXOA4RTN0c0DzTtq6sJtxw4d9fnGFWfJ43K/qtxYHjzJoezdxL7shYY/bitHIIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7263
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
Cc: Juergen Gross <jgross@suse.com>, Honglei Huang <honglei1.huang@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Chen Jiqian <Jiqian.Chen@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Julia Zhang <julia.zhang@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 04:09:44PM -0700, Stefano Stabellini wrote:
> On Thu, 16 Mar 2023, Juergen Gross wrote:
> > On 16.03.23 14:53, Alex Deucher wrote:
> > > On Thu, Mar 16, 2023 at 9:48 AM Juergen Gross <jgross@suse.com> wrote:
> > > > 
> > > > On 16.03.23 14:45, Alex Deucher wrote:
> > > > > On Thu, Mar 16, 2023 at 3:50 AM Jan Beulich <jbeulich@suse.com> wrote:
> > > > > > 
> > > > > > On 16.03.2023 00:25, Stefano Stabellini wrote:
> > > > > > > On Wed, 15 Mar 2023, Jan Beulich wrote:
> > > > > > > > On 15.03.2023 01:52, Stefano Stabellini wrote:
> > > > > > > > > On Mon, 13 Mar 2023, Jan Beulich wrote:
> > > > > > > > > > On 12.03.2023 13:01, Huang Rui wrote:
> > > > > > > > > > > Xen PVH is the paravirtualized mode and takes advantage of
> > > > > > > > > > > hardware
> > > > > > > > > > > virtualization support when possible. It will using the
> > > > > > > > > > > hardware IOMMU
> > > > > > > > > > > support instead of xen-swiotlb, so disable swiotlb if
> > > > > > > > > > > current domain is
> > > > > > > > > > > Xen PVH.
> > > > > > > > > > 
> > > > > > > > > > But the kernel has no way (yet) to drive the IOMMU, so how can
> > > > > > > > > > it get
> > > > > > > > > > away without resorting to swiotlb in certain cases (like I/O
> > > > > > > > > > to an
> > > > > > > > > > address-restricted device)?
> > > > > > > > > 
> > > > > > > > > I think Ray meant that, thanks to the IOMMU setup by Xen, there
> > > > > > > > > is no
> > > > > > > > > need for swiotlb-xen in Dom0. Address translations are done by
> > > > > > > > > the IOMMU
> > > > > > > > > so we can use guest physical addresses instead of machine
> > > > > > > > > addresses for
> > > > > > > > > DMA. This is a similar case to Dom0 on ARM when the IOMMU is
> > > > > > > > > available
> > > > > > > > > (see include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect, the
> > > > > > > > > corresponding
> > > > > > > > > case is XENFEAT_not_direct_mapped).
> > > > > > > > 
> > > > > > > > But how does Xen using an IOMMU help with, as said,
> > > > > > > > address-restricted
> > > > > > > > devices? They may still need e.g. a 32-bit address to be
> > > > > > > > programmed in,
> > > > > > > > and if the kernel has memory beyond the 4G boundary not all I/O
> > > > > > > > buffers
> > > > > > > > may fulfill this requirement.
> > > > > > > 
> > > > > > > In short, it is going to work as long as Linux has guest physical
> > > > > > > addresses (not machine addresses, those could be anything) lower
> > > > > > > than
> > > > > > > 4GB.
> > > > > > > 
> > > > > > > If the address-restricted device does DMA via an IOMMU, then the
> > > > > > > device
> > > > > > > gets programmed by Linux using its guest physical addresses (not
> > > > > > > machine
> > > > > > > addresses).
> > > > > > > 
> > > > > > > The 32-bit restriction would be applied by Linux to its choice of
> > > > > > > guest
> > > > > > > physical address to use to program the device, the same way it does
> > > > > > > on
> > > > > > > native. The device would be fine as it always uses Linux-provided
> > > > > > > <4GB
> > > > > > > addresses. After the IOMMU translation (pagetable setup by Xen), we
> > > > > > > could get any address, including >4GB addresses, and that is
> > > > > > > expected to
> > > > > > > work.
> > > > > > 
> > > > > > I understand that's the "normal" way of working. But whatever the
> > > > > > swiotlb
> > > > > > is used for in baremetal Linux, that would similarly require its use
> > > > > > in
> > > > > > PVH (or HVM) aiui. So unconditionally disabling it in PVH would look
> > > > > > to
> > > > > > me like an incomplete attempt to disable its use altogether on x86.
> > > > > > What
> > > > > > difference of PVH vs baremetal am I missing here?
> > > > > 
> > > > > swiotlb is not usable for GPUs even on bare metal.  They often have
> > > > > hundreds or megs or even gigs of memory mapped on the device at any
> > > > > given time.  Also, AMD GPUs support 44-48 bit DMA masks (depending on
> > > > > the chip family).
> > > > 
> > > > But the swiotlb isn't per device, but system global.
> > > 
> > > Sure, but if the swiotlb is in use, then you can't really use the GPU.
> > > So you get to pick one.
> > 
> > The swiotlb is used only for buffers which are not within the DMA mask of a
> > device (see dma_direct_map_page()). So an AMD GPU supporting a 44 bit DMA mask
> > won't use the swiotlb unless you have a buffer above guest physical address of
> > 16TB (so basically never).
> > 
> > Disabling swiotlb in such a guest would OTOH mean, that a device with only
> > 32 bit DMA mask passed through to this guest couldn't work with buffers
> > above 4GB.
> > 
> > I don't think this is acceptable.
> 
> From the Xen subsystem in Linux point of view, the only thing we need to
> do is to make sure *not* to enable swiotlb_xen (yes "swiotlb_xen", not
> the global swiotlb) on PVH because it is not needed anyway.

But this is already the case on PVH, swiotlb_xen won't be enabled.
swiotlb_xen is only enabled for PV domains, other domain types don't
enable it under any circumstance on x86.

> I think we should leave the global "swiotlb" setting alone. The global
> swiotlb is not relevant to Xen anyway, and surely baremetal Linux has to
> have a way to deal with swiotlb/GPU incompatibilities.
> 
> We just have to avoid making things worse on Xen, and for that we just
> need to avoid unconditionally enabling swiotlb-xen. If the Xen subsystem
> doesn't enable swiotlb_xen/swiotlb, and no other subsystem enables
> swiotlb, then we have a good Linux configuration capable of handling the
> GPU properly.

Given that this patch is basically a non-functional change (because
the modified functions are only called for PV domains) I think we all
agree that swiotlb_xen should never be used on PVH, and native swiotlb
might be required depending on the DMA address restrictions of the
devices on the system.  So no change required.

Thanks, Roger.
