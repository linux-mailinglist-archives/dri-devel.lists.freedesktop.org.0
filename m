Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FD869F9B3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D312A10EA57;
	Wed, 22 Feb 2023 17:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0081A10E046
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 12:16:52 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31M8xrDP022840; Wed, 22 Feb 2023 12:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=SGtRXeJfNFfM/gBHhH1VwoE+tnJqvkB4bqZxQM6wlj8=;
 b=k8a9fd7P2UI91b0fR5rm+e+bzlLHBOkb4PE30J7wPx/PVRCaK/yxT4h29cmh9Y3Q2ou0
 pPluNlN3Lm21mq/phpIrMcdJdrd1pNcjfO3PKujcfcZUWah5MNw/yBo/WQt+B/bkjM4B
 8Pc1xvO7xLck7Mfzg1AF96cWWIue01JV4DY6O0jFNkTQbAq0bEO4kyoFyCklVCWnyHAr
 Lm7YMB6GwXKqXmAR/UDvWBUoB7Jk4Zi/LH2j5PC6hc3NhV+dfCJnlvCbmgIcbleE/cqw
 gdqdI6MD8+agNNi2TrhRUVs8QvOckSTr7TJiG1sJ64j01oHCSIVVjCdKuBRfegGOG6WS zQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntnf3fq86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:46 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MBJD7T023916; Wed, 22 Feb 2023 12:16:45 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn46j5ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 12:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTREfshGE7ON5olB8yNu+saIRjmnA+BMwwIjznqtuiqRPrgG19CWhuSWbF1SL9O7HFEW5KimHYuZ6MhMhZXU+2pSXdr92qZHCMeKp5FTaP4efXc/vbZvvaCWqeUaR06mYhSKqiy6/nvO7m9YCbL19w1JW1cJ5ZHdTWKSwXfOem2IzHmFj+e/9nRP9hbm3xpVnvaBZoZW/uuJMAEsBc20RbJ1dke88/fo6I1RkSvREtYg6k7Au8AkeyURJ6mIGvFAu4caTV3YnLj+qEpLOL75tm4MTF4VBl7g3Jtejk4jCJOtgFhMElcgPFYn0+FKyPMLN6ccVEMjRJFJphnQOCZ8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGtRXeJfNFfM/gBHhH1VwoE+tnJqvkB4bqZxQM6wlj8=;
 b=jZnx4qz6aLIRE4/bQOSX7DfC432CSThG18ZcIujw6Urz1dI1T4gKz42SsjjcNyuX1pLbAygGsZKnTlfUcp9PX9cKE24lhPVqUm1TWqWLRA/qntLcNqswKV2j1HYAP0OarlmIdx6SNiyLPNdBVaUo5vnOY+whj402ZZY07t1lV+/CDFsj+bmfyohqKosfhPeF10hg9XU92+VhJTueZGix6yr3qpUHSP2dOosQscqu50baXKxmcp1i2ojv397xtotN58MdhH1+lbrlxDjdwTNTQaIOinDi5rWuTP3JUYHEj0D/Z37uU871BD0BBmsC7Br2/RdG1hOhDmDP7K1UUscs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGtRXeJfNFfM/gBHhH1VwoE+tnJqvkB4bqZxQM6wlj8=;
 b=ZeMMCHpwlPCa67idoX3Fc23CorgY92uCjnvo45uXL8NQ8xRA5/Mt1ymAje3FzlqY9t2UEBRRS3KOHErGQOSujo22XvFWbXumKWHl9042JP/hP01Zlzxm/xQa+nKaxoueYCJvOSrYvCJ9BQZ9bN2yMUGin/l2V0yEOK6UNgnxp3k=
Received: from DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20)
 by IA1PR10MB6805.namprd10.prod.outlook.com (2603:10b6:208:42b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Wed, 22 Feb
 2023 12:16:43 +0000
Received: from DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760]) by DS0PR10MB6798.namprd10.prod.outlook.com
 ([fe80::d0f7:e4fd:bd4:b760%3]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:16:43 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: mcgrof@kernel.org
Subject: [PATCH 22/27] kbuild,
 dma-buf: heaps: remove MODULE_LICENSE in non-modules
Date: Wed, 22 Feb 2023 12:14:48 +0000
Message-Id: <20230222121453.91915-23-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.39.1.268.g9de2f9a303
In-Reply-To: <20230222121453.91915-1-nick.alcock@oracle.com>
References: <20230222121453.91915-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::19) To DS0PR10MB6798.namprd10.prod.outlook.com
 (2603:10b6:8:13c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6798:EE_|IA1PR10MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cfebb90-62c8-4593-ee1c-08db14cea91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtbKnKvNBdGSmELJvDMICAJMXjvVd3RFfj+gm6u21/GNM1ROLfadlLfQsVgjLpmRYhktZQ/8112Z5XEEgO/El9fX1xap7s3NuEwwXhwzAOpTkUFxPHAeBxX6lrfWzUpivUQ9LZZDAWegUX2K40skc6Bxtq8a+b1XjDbMyqf03b8upF90/2vlbIWpWOkBrZoNvKAjdMZoVlrAR3C2s/9c1GaRq20kHlAeiiifwaQSjgSRTvm7/qm586htpqKopijRruNdkVt7PD2xVT+MhYwa9mkLu7qX/As4O8gNatkAErsEusNVETjSvnvh7TMns8lq54CG2OQ8iQGQkemo1PVymAvfADnofe61ig/YSI3XpRwSpvwBpAgQXMTv3CPVexAmiR+40lFaNf7M5vgZkkEzjXI86AxqA6q58RWNEAHe84LnIF5i8Mpe3MloTwTKc4dZRUGXnGhyTgzVdFqEo6yo7XEWFlaKbhbe/ahROwY82+dhuV9oZMjw6mCWVLcI2gPsx5BLPUbVlfVKRt55IAXxA91cscOO63L9QR/slNLpaKBLj8WMrUkE7mVNahvosOo/pbY5l2ko0vOWj07Yj6kCU8ptvYRsHB5xmgW8AOjr3rtCbcy6t5pnovoy7KRx5rUXii9AJTrE8ivr/vhEcvwqYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR10MB6798.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199018)(36756003)(5660300002)(44832011)(83380400001)(2616005)(6512007)(478600001)(6486002)(6506007)(186003)(6916009)(66476007)(8936002)(66556008)(4326008)(66946007)(86362001)(41300700001)(8676002)(54906003)(1076003)(38100700002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU16QXBUaGlhTnpFdUV5L1FOTXg5RWNKcUViSWhuY2dsZkVVYXJlZzRmNXhr?=
 =?utf-8?B?ckRYdTJZODg0SWpUMzlpTXhtU2V1bitqNHRnRGJjdjUzaU9jaldKcE56S3lq?=
 =?utf-8?B?RDRCZjI3WGNab2dkUUxuVGVISENMdzRxNHZVT0xqdktxYmpwV0Y1TzJIa0Nj?=
 =?utf-8?B?cjRJQm9OVVkrWStWaDBSUWtXT3NtckVNSis4ZVJubXpxRkNKMi9ncjNkTmpP?=
 =?utf-8?B?OUJPYm9TM216V0E0cGJ5allKdUtQaHRhYkE2aUxmWGRONHYzT0pQMEFDdU9z?=
 =?utf-8?B?TGpudkNrVlhNRW5jZzN4MmdHY2pWVEg1akJEc0hDM2V3c1V4MHljN3ErQ05u?=
 =?utf-8?B?Ry90OHZtVHNKc2pvSFZSVnY4eTU1YVo0VkJOWHBRTUlJbHBsYzVwVmpBcHVQ?=
 =?utf-8?B?YnkwZHZSRG5KNnlrWnYwOW50V0VtNWZTeHdtWE9oclBJYkFsYXhwSnpONGZX?=
 =?utf-8?B?aXRMbnB5Rm0yM0hrL2tBeWZEdXF2TmpmeHQ3QW5Kd05JTW5nay9qajI0bGtn?=
 =?utf-8?B?dUorQnNaM091Z04rUGhzdkhvTjJLSUtwa0paTHBiUVhFVG1XcmFFZU1Wck53?=
 =?utf-8?B?b3JXNmkvdTN2emR3YmlMRWhjLzZvYTdRdFFkNk12MnVhSnkxRU5rVUZUWXhJ?=
 =?utf-8?B?T0VMVENBUDg0bGdKV0VEdUJ6SytHdXpnbUFiN2IreGY3YURYZDBSaURQU0Z0?=
 =?utf-8?B?bHBCRHpGUlZwclp0bS9xNXlMR0EzM0R0YjBKcVJNc1VjTUI4Mld0MGJoZlhZ?=
 =?utf-8?B?eHFnSzdZbWtBeVFUdFR6WkhUV3lGNkFpamdwcTJ4bUNhdDZ1VE9QdDl1aDd5?=
 =?utf-8?B?ZnJCeEt0b1QyUitJcU5Uc0RpM2VkUUFzT1owTjUrNWFrRlBySTdiVWdFZTY1?=
 =?utf-8?B?bktKRk5OakV3VVE1Y3J3S0dSQmFxSHJBZHBzNWtaRGp3cEd5ZlYzTVAyMW5H?=
 =?utf-8?B?d0tyYkkyVjhFQnM5TGM0NFcweHRUZCtZaWZSRGMzMHppeDdvdmVhNmJhTWEw?=
 =?utf-8?B?NXVrZ21CZU5lU3Q0RDE3RHBVTDhFeTRVU3JESllLcy84SWxmRkl4R3VrZkto?=
 =?utf-8?B?eE51S1VLSmFnY1A5cmFZV0Q0c2VMWk0yUkVIb2oxYmtFRXcxeS8zRjJ1S2ds?=
 =?utf-8?B?bE4rVS9qR3JFenB2SFpHUHQ5UnVkMWFPek52LytMUEU2SER0Yi9IQUJtajJE?=
 =?utf-8?B?eVRSUXpndkVuUUdFODJ6ZldocHlRQTB1UHdPM3h6VXp3ZVZOeDIwYUttallY?=
 =?utf-8?B?QVN1SXFXeWVJcnI2OFFNWUpETW5Bd0Q0ZTNFb042dFMwN08rYnJJY2tRNTRi?=
 =?utf-8?B?YWVJS1h5Z2llSmVaa1hHWDlUcVFER1hWNlErbGpIOXdhNzcxdi9kOU9HWlFt?=
 =?utf-8?B?a1hyVGNCeUM3UllRcWdoUEV1QzlCVVl5U3hUVlZQNCtmamZqWkUvdytxdWVu?=
 =?utf-8?B?b3E1NjNKays4TUxwd1c4SjJUYnlDbUZTemFwN2FIejJRRnFWSWEyWGEwNmxY?=
 =?utf-8?B?QzlyYXg2eVREc3pwSWlwSFNtUXFLVkhjRHNvMFgzRXU3TFNpNDNoZE1xd21P?=
 =?utf-8?B?KytXZTlobDlkK3ZPU1dtR2k3VUpkT1dVRmRNNlFEYnU1djZ4alZvNzB0N0hP?=
 =?utf-8?B?K2lvMDBxL1V3ZUUvZDJOZEhJZ2ZQaFAyUlZEVVZkdjM3Mnh4anFXTE5STXNY?=
 =?utf-8?B?WlRhcmZVUlN4ZEo1aFhJSXc2NUhwYXZpSHJCckFyNGJrNTRJNCtyd2tvMjEw?=
 =?utf-8?B?bVVDdFZESGVlSkNSSHFSNGpZc2dFUzU3TWFXejBPZWI5cUI4YmJYcUw1eGFV?=
 =?utf-8?B?b3hhbkxTZU0rS0VKL1g1QUpzTkNNcUxBakpsalRDeVZJdDhFNkFNZEhrSE9I?=
 =?utf-8?B?RzR1ZzRjcTFzUXBpRWdhMGJzeDJDOGVtYis3SHFXeEh4VVowVnBpTTZ5RGJH?=
 =?utf-8?B?b0RmNWdiTGdvMzZtcWg5MVE1Y0l6VzVVMzdvL2RJekg0Sk5IVlZaY2VCdnZU?=
 =?utf-8?B?alhuTXcyV2dXRG15aVoxUS9RRmNtbk15b2FSN0lTRDF0M0FST1VVL29RN0hC?=
 =?utf-8?B?MU5HVDBNN2o5WDIxWFM1eEU2OW1iSWN4MnJ0QWVCNzFsR3Y0UkxOQVhnK29V?=
 =?utf-8?B?WnJ1SXpCa0hrSGpCMHIxS3NVbFM4Mk9JbFJzUFN4TytCL0hXSnFvcDlvOURU?=
 =?utf-8?Q?1IVjUpoYaFKTXE65lFbwMKE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?a0dqd2t1NnZEOTJMNStITlpHN25naVRvQ2VzTVpieitsNlg4SzNhdGNYSitR?=
 =?utf-8?B?YncrTXlzZjZKSm50YTVHTVNOd2lUWVFJeTR5SUFVL1kxUStyYi81REZ2cVlD?=
 =?utf-8?B?em9EQ2lrNTdQSXBydkoxOXl0K1BpU3JkQ0RQaWxqbHRFd3lVWnY2TDVkc0lW?=
 =?utf-8?B?Y2I5NzQzQ3VwZC9TWGJUNDhrMVJhTVlnR3lUM3JQL1Y3alVXN2lGTlJhcFVN?=
 =?utf-8?B?ei9hb3pNVHM5dzIzd0tISGg1c0tPNmllaWkzcDFCNHhZOUF5YXIyQkFjNHRK?=
 =?utf-8?B?NFA0VkdrK09zQ3hvWjhHWXhlQyt1dkRhYlVudlkzWTRQdXlza3hMZmNWRXJ4?=
 =?utf-8?B?azlFcHdmQndZbXNYNFRMa2JsdTdqUlRrSkFEUUJuR2tZYTBzVUppNzEyZXAr?=
 =?utf-8?B?eWMxQVUxN2lxWWoxa0JkQUVjNjFDeTJCeWtYMFB1b05KMy9ZenNYZGlqNklq?=
 =?utf-8?B?WmpBZTk4TTFxN1VDNGM5SWd6OU1xWVJxUzFDN2tmVjZIRXIxV0VZOVpFbFlY?=
 =?utf-8?B?SitoNmRrUDZmNno5dGVIZHdxczdnalVrSHZacG96OFFzOGZ1S05RVWlldk1T?=
 =?utf-8?B?TEtUeWRkbDZYcFRTMzlWb21CN21KWGVyWGNKTVRkRUc1aGJzT1MyYmtxMHds?=
 =?utf-8?B?L1hkYkV4dzQrOW1QZGJ4Z0doaU9lY1g3WkdJSFprYkwyWHRLb1pCZnEzeGwy?=
 =?utf-8?B?TENuNVlob1ZCci9XdmxrVW8vb2FNYkJ4TkRYSEVvSFc3SjRoQWxMOU1wR3V6?=
 =?utf-8?B?L2lRSzNoS3RxNXBvbzlIaUpJTmlBMTNZWGhKejFyNWpObEJIOHVZWUw1WnV3?=
 =?utf-8?B?WHVMNUNCR1l0dmxpTVJROFZuQ2NRQldjcjBJWXp1eDk0bjNHSzFLenY0S1kz?=
 =?utf-8?B?NXBDdy8zRGpUTXlVblBTRjN6NXcvd1RNWDUwSFZVaGtWV2ZMWTZSTDUrTnFz?=
 =?utf-8?B?L2cydk5teWJBT1VVYmZ2Vm8rbmNZQVpKWG1hWXN5Y2gxamNkMDBsRXBrTVhB?=
 =?utf-8?B?NWhQQkJGQkdWS1Ryb01pcE5TN0oyZ1puODdMN29saVpzbnp5NVpqTU5kVTh4?=
 =?utf-8?B?SEVLZytKOFlTQzROREU2aFdvSXgyaVRpSGhkSWxFZVV1a1ZxVWVXY0VqY3ZC?=
 =?utf-8?B?d3BuNWVqcE5IRXB2bXREeTgwTDYzQ3VaV2NZeTd5MEM0cjk3WGd5K3lRVG8v?=
 =?utf-8?B?Q1RnVUo2R001M2tySGJ4S1BZSmEyZWtwcDF5OHMyN3ZaSW80T0RFWmdib0ZQ?=
 =?utf-8?B?azFlOTAvL1M4V1orTi9SSitKeWkreFZqS0xKeDBpSWxGbWhENmxtM1ArbGNI?=
 =?utf-8?Q?Z2vKsG5NBIrkI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfebb90-62c8-4593-ee1c-08db14cea91f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6798.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:16:43.7422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7WygTcLIyOy1GaI6WQUv2aXvtSRJAu7sauU+RMyHPSLEqPbflUDPzGitrFdZDUwwBIuNYpS+twfGJaM+Cnpug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_05,2023-02-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220108
X-Proofpoint-GUID: tVI91aF08oC61edgE4ziXez_K1l3Aryg
X-Proofpoint-ORIG-GUID: tVI91aF08oC61edgE4ziXez_K1l3Aryg
X-Mailman-Approved-At: Wed, 22 Feb 2023 17:09:36 +0000
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-modules@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 8b41fc4454e ("kbuild: create modules.builtin without
Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
are used to identify modules. As a consequence, uses of the macro
in non-modules will cause modprobe to misidentify their containing
object file as a module when it is not (false positives), and modprobe
might succeed rather than failing with a suitable error message.

So remove it in the files in this commit, none of which can be built as
modules.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/heaps/cma_heap.c    | 1 -
 drivers/dma-buf/heaps/system_heap.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 1131fb943992..a7f048048864 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -407,4 +407,3 @@ static int add_default_cma_heap(void)
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index e8bd10e60998..79c03f5b4e28 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -440,4 +440,3 @@ static int system_heap_create(void)
 	return 0;
 }
 module_init(system_heap_create);
-MODULE_LICENSE("GPL v2");
-- 
2.39.1.268.g9de2f9a303

