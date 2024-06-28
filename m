Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0791BEAE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 14:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B1A10EC2B;
	Fri, 28 Jun 2024 12:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NDrTBw+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EB910E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 12:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYsLI3fT6mRHhE5qHXhUWGSk9qOELCsFEbIKk4Y52WUVvp0zfj1pFFy9BfRzf0JkLLZoleEoLH/dpXH3LWoHok1CPhGLOwJMo054Fngw/swytK+W5/sfg6pKW63LscxbFssNnqGHj3ONTTEKT3E3FtND7Gg4H4Hon42m6VEt+/8TP3M3beixaee15B8Fn5DVLRqMOqFJRvGDtkflICZsWMTqn+8+l7zaNA2Gy9yRegPOHBpPrS2hpzuvSyQVg9HoJsjWv8JscghWwiTzusFP5UOZo90UTaznOtLGT7iR30S1upZ7K5SE6SyXMhQEgAnoI6Vy+P/80NAo+feB8gJDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnIMPV5794vh5rfsIRaBDvKj8of5k/C8mcaw8nA9VEk=;
 b=h/RZAGH5/exjQb3En2cA24PwvvVwsjzjOgs6iuTU48xkPlXXJeZgZilIvZjs+suGeu28wOKknjFAa81rgaehJtMcq6Da48ehBUuFoBd5m76/nrtK062zBLU2jmms0BS4G389dDOufj2ah3a3TabuqHngbLdVz5vGrMDXdgZOMJKkSV3z4qIfN/j1eAzeKCgNPyLFDwrc4VUOERXWgDTh3F4sDdE+yaOJ9rlYCYBuJ+iAgWBK7W8SA/h/w4m5BA6yGpUQ05WpMF6PAcCtEDTDPv4BLL2SLOKEXXM9DK4ISAlH9HSNqbQt9sdM/Bz9kJ54hNTNUoMs/kDVssFif1/nPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnIMPV5794vh5rfsIRaBDvKj8of5k/C8mcaw8nA9VEk=;
 b=NDrTBw+jGAXZLRqPka8ptWzO2dZsZ3Nk5WznN8jHGHWL+MDGQC6JWY/S/u4cSsJvv2PnH+DoLc+plffDoQGAw5cI+TNjHGEM+RTFMOUJEv4/Q5iN47Wzw0LTxE2fdskCVuCW0oYTH568xrD1kVMtHbI3E9OdQE0giLD0X7j3C7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 12:34:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 12:34:38 +0000
Content-Type: multipart/alternative;
 boundary="------------C0aQmTwxioyLEo0IQomIMqEu"
Message-ID: <c96f82e3-bbd6-407e-a71b-3a794a56585b@amd.com>
Date: Fri, 28 Jun 2024 14:34:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: Thierry Reding <thierry.reding@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
References: <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
 <w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag>
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 984d3781-4dd9-49a0-d236-08dc976eacc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlNnNHN4alU5NVJ4VU1HcEl1TVJUNHpzUzdkSHdIWkNJL2xJZjd3R0ZlTGI0?=
 =?utf-8?B?ZjlLdkZtOHp4Mm50aHo3UWwxUE8vVHEvNVdldEk3dU9CMXpxYkZueTR2ZHR0?=
 =?utf-8?B?MDY3ZFZPTWRpV0NqOGROZDJFMzJFTUJiZUl4Z0FqeGZYa0RWODQvQ09vR0d6?=
 =?utf-8?B?Z01sUzBDcFc5Z1VSaE5yTEd2bVpveXZQYnhudmhabkpidTZvdVlhT0UzQVR5?=
 =?utf-8?B?cDB1VWFDZzg0eGJ2c01MaW11MFBCV1YvU0pUQWZKNStveGthR0hmaGtGQ28v?=
 =?utf-8?B?c2ZLYzdaZis5dkJHQnlRU2p3MnJQdGxab21vR0ZWbmZoTXhQY1h6SHlRM2Zj?=
 =?utf-8?B?UUxncVlPTUFzcEVUckZqU0NhSHhGazdFY2RYMjNVT2VzU1VjZUJxUTFCaENn?=
 =?utf-8?B?bThLQ25JVDFSWHk4Yk54ZTc3a3A3enJRbnhPdDZJeFVsNDVXanlWcWlYTTBm?=
 =?utf-8?B?V3o4MWpLNXFlSXFNR1ZtMGZ5Tk9qSi94ZDZuekFzYXQrNWh0NjRDYi9lN2tE?=
 =?utf-8?B?QS9PVUJwS3o3RTdHM09HdGk4aE5rcG1zdktHMExjZXc4QXJCbFJ0Zi9tLzNi?=
 =?utf-8?B?NDZXdStEY0dnVGtwZEdtc3dmVWExTWRUa0R6Z1pnaFQ2UFJob091MURabUlQ?=
 =?utf-8?B?V2E3N2NGdGRzZm5ITk94QTVuTVFSUFQ3YWszeFZHSXl0YksvUUVXdUhQbW1G?=
 =?utf-8?B?NGU3Z21Cdk9iVWdSZGpUZ0NwbWxLZzFDNy9yK0N4aUs5Vms3VzE0SkVmZWxJ?=
 =?utf-8?B?ZVBrellYSGJsSENmcER6aHdrdXBGV2t2MXlqbXNKSVFVd1NjMmJGcjNKbTFo?=
 =?utf-8?B?ZGsrYU9MZy83eGRRUmo1eWkrYi91ZWJka25kNUZEdnVSU3NCSVc4RDR1K0M2?=
 =?utf-8?B?TkZhb0d6OWtBZFJpZXdIR2JuYktxVkFtZmgxL0Vub1VuVVpkYXhPYXZzTzdh?=
 =?utf-8?B?MmlTVW0vaURTSTdQb2YvdG9iQmhFbnNPeXE1czR4OE51ckRGMlBpbXl2ZUNh?=
 =?utf-8?B?VUc0VENGMHZ6ZGpyS2pURlRJM3R0Wm1GNDB5VVFabmVDLzNwR09mOEpXeDBh?=
 =?utf-8?B?VklQMGpjdGE1Z2RSVzA0ZzVBQVVvSi9JMlRicm9jOU5iUi91QmJDdURKK3Ro?=
 =?utf-8?B?azZYSElSTzlQWmdoM25OTjJLUkQrVW9lU09tMFBoTmZPdTRNM3ZTTngzUVdp?=
 =?utf-8?B?NGtzbWJGVVpjS2Rsc2pCSks3ak95ZDZ1NE95NmJkbnU0cGowNy9EaEJ3cUNy?=
 =?utf-8?B?d0xZOTRmMzh1SlJNTGNKNEcxOUdZelhnWk1JdmdSM1haT2RIUjJSVWs0OG9n?=
 =?utf-8?B?cENKSWt6MjZsczAyRHQ3UlBxUDI0RUZYL0NwZGdCTUtvWW1yek1nR3lUZlo2?=
 =?utf-8?B?VGtUdTg3MVJlLzZNT1UxdmZ6dVNSY1lscmtUL1BYdlZjU05nTWxOV1ZTN0ZT?=
 =?utf-8?B?UDdEYkNwNWJ0NlBuUUlDUU9ha053RkFtK1lVTndhMG4wZ05XY3BUZktCZ0hU?=
 =?utf-8?B?bTU5aGM2Vy9wNjdOUkdOL2VTSzdZZk0yUEQ3N1hXVGY0cTl6YkZ5U0pJdlMw?=
 =?utf-8?B?d3NXQi91RXpTK2lHWjRJTVIwNjlNRldoeU43RWEwUDR3cXZnR1U4OTlmSFcw?=
 =?utf-8?B?bDZjczNwQXZmWGtUOFAxZSsrR09OSGhjK0dZMlJnZjZpSEdWT0RqQ1BrWVll?=
 =?utf-8?B?NGNnUmxJMFNHUFNZMzcrcTNLQThRejJzUllmS3BYUnZHUFFCUXVPRm02aU5k?=
 =?utf-8?B?TUZDaW1CaHI4amJxdmpQSEcyYjQ0VTJTeWdmK2VLekU4bEM3MlFkblhRTU92?=
 =?utf-8?B?dm54RGRSRWtaZUFoaVphZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWtCWE9kSUhENm1rbGRYNUU1eGFvSHNpdVc4RHoycHBPMGJRZGg5NjZBOG1W?=
 =?utf-8?B?OWo3MGpEcWx6ZXJ6SU5GYzlYRFdzdXREc2RtUUozTDB6aHNQdWJ0UER6Wit5?=
 =?utf-8?B?RGN5bGZKWGczUHFTeXV4VWZLdXdESy8wOWoxMkc2b29kOUc5ZjJWeDlQMi9E?=
 =?utf-8?B?TTBqSU53eEZPTFZab01uUUlRNjRxL29OcHlJQXlzYSs5bXFTbmg2dUo3ckRV?=
 =?utf-8?B?ZytTbHp2b0hnbkIxM2thUEppTWRCUEJLdjRmUkFxZWhuZHJwN3k4UlZOWGJ0?=
 =?utf-8?B?U1Y5dGVzRmQ2T0ZZbGhob0ZnT05YTFVWQkpXSlNNcWNHa3BnSDEreUg3QjBy?=
 =?utf-8?B?eW5RTDlPY251c25qamlXNldnKzQ3cU5tS0N5Y0NMSmJUU0lPc2ZMcnByT3M5?=
 =?utf-8?B?ODN6byt6TFROOWpCdGNxcEZVM01OMGtJdUozbWVYeFA0aUdwQlE4WHFxUGdN?=
 =?utf-8?B?bURDaDBPTnNmQ05zdk9FWlhrRjlLdVlHMGxmQ2ViZTVUUlRKQ1hlWXFTVExs?=
 =?utf-8?B?YlhDY3dsVjIyWWprZitKM1VsUEh1QXBuNXFpSGk3ZzZWR2xtU3lBMVRTaUUz?=
 =?utf-8?B?VDBJdFJmUGNUc1lPNlRZbytqU3BUOTJ5SXNGOFFPR2IwNTE1KzYrd25qd2lH?=
 =?utf-8?B?S1gvMlpWdGVrSU0vWTlDaDJXZ242YVd3Zkdyc3RWV1FxQkdsKy9HN3JuNlJm?=
 =?utf-8?B?bk1wVmJGVVRyeDBnQlJRRmtYSWZDVSsyd2VqRHVkUVU5M1JzU0ZtcW4zZ0hI?=
 =?utf-8?B?MVBid2QvSVYrTWdvcjNOeERiZTBQQnRPOEtSdllGUkxxYlBMbDQ2bDQwSklT?=
 =?utf-8?B?czlQMW0xUkk3elA4SWF6eXdyWnZvUEczUFR6b2xZbU5FZWVkWWVFU1pQM28r?=
 =?utf-8?B?bkprT2lxSkpmeG9pZ3FMbkh4QWNoZ2I3bTdVRmhDQ1h4S010dHFwckVoN0du?=
 =?utf-8?B?aDBWSFQrQzlQNlJMZVNmdXNtNk51YTFyZ3huTzlOTUVxOTZUeFpsWlM3bVRK?=
 =?utf-8?B?UGJ5YWtnM0E0V01mVmZNRER0bk10S2R6cWtEZGdJWUgzclUyazJMU1lZQ2Mw?=
 =?utf-8?B?VnJ5ZTZtYnhwVGFENlZFbThqcEFpV3pRK01KVFRLRVcrK1ZGMXl3dWZpS3hM?=
 =?utf-8?B?T212ejdBb1MweFNXZTNRcWwzQjkzekV6T0d6KzdNNUtiUFl2NmxxWkJKQ3NY?=
 =?utf-8?B?T3l3NzRQSmo5Q3VHejJVcEIrVXcyVEpnMUFDYW1Sb1RTc3lqWTFkUE5TL2Zi?=
 =?utf-8?B?M2ozem4rMm96clQyTjlxYWZZUVJXRTRqaWhaT2JMZmJBYlh3aGJoQjgwMm81?=
 =?utf-8?B?K1ZlV000VEtHMEVsY1h2bkVWZ040cE1scklNQ3RySjhtQVpTQVJnUFlpMHVl?=
 =?utf-8?B?MDNMYkxnTHpiSlJuSnAwbncwTmhxeHJ5VlVWcmEzZVpNSWFGNkJNM3BsRWgx?=
 =?utf-8?B?RFF6R1h5QW0vek1yeEY0L2tpb2tpZFc3QVlCbnRRd0ZRcCtiUHg0L1BHSFNa?=
 =?utf-8?B?bkhPdFBwblBiN3hGc09sTHhOaEZuNDJyc0h3MS83QjZnOVNTcGpudWQvWkx3?=
 =?utf-8?B?TEg0TCt0cGNic3ZvVzdRUDZKajJKeHRGNkswY2VzZHdzcENGRFNlMkY3d08w?=
 =?utf-8?B?SjFkeVV3NHVWS3NFQ2xCTU5weUREL01jWTJWdmEwcXIzMllrTVFkaDNpM1Z3?=
 =?utf-8?B?ZXd4ZlBXcDk2S0RBYkFiWUh4NUNCUDVPR0RnQUp6TXRBVkg0YzRONEhJSUJl?=
 =?utf-8?B?QnVpcGhWb1NQa2Jxc1FmeWNIZXBkTWgxa1RZZ1kwOEVZMnVGaDIrZXd4b05t?=
 =?utf-8?B?WVRJWUdCNWlQNm9uVEFTWTM3VmpKOTI3ZWFraTVkcGtzaTA2MUpCc0V4RE5Q?=
 =?utf-8?B?SEQ2dkVCMytCVXlTblBMU29uNVh5RVhKL2dYd1RkTnBNNStLM0pZc29SOXlr?=
 =?utf-8?B?Tnc0TnkxMDNjOXBXKzZ1NCs1TmZ3MkRUZGdIb1Z4ZU11RmljRHZaRDQ1VzhV?=
 =?utf-8?B?eExmNzhGTi9tNTRxY0JROENQTDBMeURab2xBRE9oNHFBWXprbjZnbFJUSHBi?=
 =?utf-8?B?SFhWcCtacXlNZGp3TXV0NUx2Q2RLRmVQYmV5NlFSM1lSUjZsY0ZnNFN6RmNS?=
 =?utf-8?Q?UXAKdOL9BAS8Dq6wB8AZrXH/x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984d3781-4dd9-49a0-d236-08dc976eacc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 12:34:38.5563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OrYxYT2B80F0kF9ncD49XbXg72oA5F/CZ1A0W8coraGx0vDLCwDKCbgjEcKCfJS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------C0aQmTwxioyLEo0IQomIMqEu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 28.06.24 um 13:47 schrieb Thierry Reding:
> [SNIP]
>>> The reason I ask is that encryption here looks just like another parameter
>>> for the buffer, e.g. like format, stride, tilling etc..
>>>
>>> So instead of this during buffer import:
>>>
>>> mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name, "restricted", 10));
>>> mtk_gem->dma_addr = sg_dma_address(sg->sgl);
>>> mtk_gem->size = attach->dmabuf->size;
>>> mtk_gem->sg = sg;
>>>
>>> You can trivially say during use hey this buffer is encrypted.
>>>
>>> At least that's my 10 mile high view, maybe I'm missing some extensive key
>>> exchange or something like that.
>> That doesn't work in all cases, unfortunately.
>>
>> If you're doing secure video playback, the firmware is typically in
>> charge of the frame decryption/decoding, and you'd get dma-buf back that
>> aren't accessible by the CPU (or at least, not at the execution level
>> Linux runs with).
> Can you clarify which firmware you're talking about? Is this secure
> firmware, or firmware running on the video decoding hardware?
>
>> So nobody can map that buffer, and the firmware driver is the one who
>> knows that this buffer cannot be accessed by anyone. Putting this on the
>> userspace to know would be pretty weird, and wouldn't solve the case
>> where the kernel would try to map it.
> Doesn't userspace need to know from the start whether it's trying to do
> secure playback or not? Typically this involves more than just the
> decoding part. You'd typically set up things like HDCP as part of the
> process, so userspace probably already does know that the buffers being
> passed around are protected.
>
> Also, the kernel shouldn't really be mapping these buffers unless
> explicitly told to. In most cases you also wouldn't want the kernel to
> map these kinds of buffers, right? Are there any specific cases where
> you expect the kernel to need to map these?
>
> I've been looking at this on the Tegra side recently and the way it
> works on these chips is that you basically get an opaque carveout region
> that has been locked down by secure firmware or early bootloaders, so
> only certain hardware blocks can access it. We can allocate from that
> carveout and then pass the buffers around.
>
> It may be possible to use these protected carveout regions exclusively
> from the DRM/KMS driver and share them with multimedia engines via DMA-
> BUF, but I've also been looking into perhaps using DMA-BUF heaps to
> expose the carveout, which would make this a bit more flexible and allow
> either userspace to allocate the buffers or have multiple kernel drivers
> share the carveout via the DMA-BUF heap. Though the latter would require
> that there be in-kernel APIs for heaps, so not too sure about that yet.

Yeah as far as I can see that would be a perfectly valid use case for 
DMA-Buf heaps.

One question here: How does the HDCP setup work on Tegra? From your 
comment I guess you pass most of the information through userspace as well.

Or is there any info inside the DMA-buf for this? In other words would 
you also need to know if a buffer is then allocated from this special 
carveout?

Thanks,
Christian.

> Thierry

--------------C0aQmTwxioyLEo0IQomIMqEu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 28.06.24 um 13:47 schrieb Thierry Reding:<br>
    <blockquote type="cite" cite="mid:w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The reason I ask is that encryption here looks just like another parameter
for the buffer, e.g. like format, stride, tilling etc..

So instead of this during buffer import:

mtk_gem-&gt;secure = (!strncmp(attach-&gt;dmabuf-&gt;exp_name, &quot;restricted&quot;, 10));
mtk_gem-&gt;dma_addr = sg_dma_address(sg-&gt;sgl);
mtk_gem-&gt;size = attach-&gt;dmabuf-&gt;size;
mtk_gem-&gt;sg = sg;

You can trivially say during use hey this buffer is encrypted.

At least that's my 10 mile high view, maybe I'm missing some extensive key
exchange or something like that.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
That doesn't work in all cases, unfortunately.

If you're doing secure video playback, the firmware is typically in
charge of the frame decryption/decoding, and you'd get dma-buf back that
aren't accessible by the CPU (or at least, not at the execution level
Linux runs with).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can you clarify which firmware you're talking about? Is this secure
firmware, or firmware running on the video decoding hardware?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">So nobody can map that buffer, and the firmware driver is the one who
knows that this buffer cannot be accessed by anyone. Putting this on the
userspace to know would be pretty weird, and wouldn't solve the case
where the kernel would try to map it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Doesn't userspace need to know from the start whether it's trying to do
secure playback or not? Typically this involves more than just the
decoding part. You'd typically set up things like HDCP as part of the
process, so userspace probably already does know that the buffers being
passed around are protected.

Also, the kernel shouldn't really be mapping these buffers unless
explicitly told to. In most cases you also wouldn't want the kernel to
map these kinds of buffers, right? Are there any specific cases where
you expect the kernel to need to map these?

I've been looking at this on the Tegra side recently and the way it
works on these chips is that you basically get an opaque carveout region
that has been locked down by secure firmware or early bootloaders, so
only certain hardware blocks can access it. We can allocate from that
carveout and then pass the buffers around.

It may be possible to use these protected carveout regions exclusively
from the DRM/KMS driver and share them with multimedia engines via DMA-
BUF, but I've also been looking into perhaps using DMA-BUF heaps to
expose the carveout, which would make this a bit more flexible and allow
either userspace to allocate the buffers or have multiple kernel drivers
share the carveout via the DMA-BUF heap. Though the latter would require
that there be in-kernel APIs for heaps, so not too sure about that yet.</pre>
    </blockquote>
    <br>
    Yeah as far as I can see that would be a perfectly valid use case
    for DMA-Buf heaps.<br>
    <br>
    One question here: How does the HDCP setup work on Tegra? From your
    comment I guess you pass most of the information through userspace
    as well.<br>
    <br>
    Or is there any info inside the DMA-buf for this? In other words
    would you also need to know if a buffer is then allocated from this
    special carveout?<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag">
      <pre class="moz-quote-pre" wrap="">Thierry
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C0aQmTwxioyLEo0IQomIMqEu--
