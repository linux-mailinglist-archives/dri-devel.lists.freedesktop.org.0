Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7742836E
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 21:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA85E6E3DA;
	Sun, 10 Oct 2021 19:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62046E3DA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 19:42:05 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19AJ34G8031671; 
 Sun, 10 Oct 2021 19:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/TihzolcyV+fTPT5ezH9KRSaqlKCFKgEE08/ApUE4dA=;
 b=0WGWKJsMF1oMPmWB24Fwyufl5hYPy1gnWz+Xb4yppoPweSN+xPa3qcyTNmKTGpS+PVtz
 A8i/nh2ZcJ8x0QLavdR1qIYIKG7qXc86AAUarkcoa6XK6S++zuEFCHbGgEBWG+p+wI8o
 Yr4zSCvh3GvszSwTdg0g68LY46yHbFPe8oPCyxPxBLckKyGX6OFuTbRSulTtC2Qwypqt
 iDui6Ssvyh2k+SZG46upNGMUC16ut8yYi8xFPW9SiQkXT1c8WvdZfvFmnVkHI5jDmjY+
 xI+KJ16W5Ia2W4RbabXFHOAoWLJVMKL84GWkfk6GM0R1pSiGR4PPWh+yxtdHPTfd3frI Cw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkvh9s0vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 10 Oct 2021 19:42:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19AJeaPx061483;
 Sun, 10 Oct 2021 19:42:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by aserp3020.oracle.com with ESMTP id 3bkyxtqb1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 10 Oct 2021 19:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZYWGMq/R9Puw4/en4Yq6K3xn/0ZBVfCfhKOkC3Eslrnu3JVGfGGjzZvUJ+Tk5MGBXBR+AGTZbSrn3RwB3NtHBru9szd2005mNSVCZGz14HSSERSrZftCkaIQORhlaPbkDUGyR3FiFBHj2wUaqNiXFLgC0TKR5WeqWBbEGD4t53BqvMbLgsJ7FN4yn8JatrODyTdEpgX4PqzgpIWG9fOlBCQUe+jwbZMwVXGtjcbw7CpAhIL0JpsLOBJhGLvWpwE4zrhTloL/PlsEPRicVoJdF3Ou+J7vi6ahZ+ZqSy+snZo9/dssZ5HiGklEMn/pnXDMDuOOXzGr6uZq2IZh/P/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TihzolcyV+fTPT5ezH9KRSaqlKCFKgEE08/ApUE4dA=;
 b=CD72ywsow5pxqpsd9R7TKUqh6GaLhp1arQRb0HKCijCkpKVdjzm32uUaXNQuI+/6prPYolTu2PgzzGAHkdf4SjtIpAyX6dEoK9btwfeqKTQwEiMHFLKi1afIMsELprqm9kOGfrPnbQnOg9biPmFjOjcDEtxSwm87mJTQgJS9PxDN4T3g7C4wFThu9zdt3R2XVUz5tlVXhELLD6IK30H9roAS5ssquvXuph4elhMLas/IC9HOLBKNxVf3Jhewy0z6x0FLuBZxLLJriwehzTMcazghoeQIj2/zCRn8X6c2wbQj4TkQQVKlAiORoZvZ5gw0N+4Awv+OMawjQSloeQG8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TihzolcyV+fTPT5ezH9KRSaqlKCFKgEE08/ApUE4dA=;
 b=nCDQo1KWXQoDjRX2z9eQzZlcrJ7hBo5t8jAInjEs9e8kgUryiLwpYV/XH4hVtltEMPx4AKACuK5oG887bLoDowiKQkImAJV0qGrB4P/CMxT282ks2WPhNttZvomqRysAyyJrjTaUdkWm/E+ETB2SIVYWjGlmi7IHYH0H487cDhs=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BY5PR10MB4146.namprd10.prod.outlook.com (2603:10b6:a03:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Sun, 10 Oct
 2021 19:42:00 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4587.025; Sun, 10 Oct 2021
 19:42:00 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Ainux Wang
 <ainux.wang@gmail.com>
Subject: Re: 572994bf18ff prevents system boot
Thread-Topic: 572994bf18ff prevents system boot
Thread-Index: AQHXuIHb1jcBl5uEwUiwoZESWfnCi6vCbBgAgABr94CAAAlEgIAAAToAgAXvMICAA9sGgA==
Date: Sun, 10 Oct 2021 19:42:00 +0000
Message-ID: <4FDC98B2-9AC6-4800-BB0D-243D818BF9DD@oracle.com>
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
 <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
 <1FA5E09F-BE25-4FF6-9958-7D7B0BE9256B@oracle.com>
 <aaefdfe4-084b-7abd-5e5b-47481e20f4bd@suse.de>
 <BAE78984-959D-480E-A0F7-71CF12FCE831@oracle.com>
 <8f577b6a-3217-5b87-7dc2-eeefafef2f72@suse.de>
In-Reply-To: <8f577b6a-3217-5b87-7dc2-eeefafef2f72@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40051c38-da43-42a0-7dd0-08d98c260703
x-ms-traffictypediagnostic: BY5PR10MB4146:
x-microsoft-antispam-prvs: <BY5PR10MB4146CAA168D40CA472D92D8A93B49@BY5PR10MB4146.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S6e+DRWAnv56SvOQqvR5faB+q5tiz/87uLfIwq/zdL6AXlWTrdZZJ1Ppfe7RRCmHUetLzYX7j3jU2AYciDV5QtePyYXEMlD0bLtaX47xilUfeEFnx+fQV8qd2eTQCdfgxt9xxLyQ45nsTIcOl08Wz/cxhp2vJzIItEytiXYj6Ho7rLB9OCGm4/TUznf3M8M0lsyOIsHxnf8CsyHtVSrcQeGtx46cDygq6hOxF1u+3z5tUybwnf5EYqhMVfI5epQ45mvQZY4caPCFiWmZv31oWTyWR1UD7IVYIjYv6eaBuAWuX1668doxQskA5Xi5IqLhx72+5JC2OXkHWxKFZic8Jpy3Q4I+5nQPbwTxzeUBH8qRzJjx2RsGmrAqqsuqFIxKrkhLpyrg3xHHeWGF8r7Rx7KAWPuWLCvwnxKDXREFxZvqNynlfGT3Rj33RotjYjLMrLZRmnxxmga0YaF8iN0H3v6xYKZLDZqq/IeGuXDJkC1ycfl6vJFXC+/KpnVYhLlJyuECvcrBWWTSa7j1MFlZxKHwmksS6qbX7IgTpAq86JeMR9CKBGAR2+qfaYhyBQbLawYtrbl/XWQSp5t9XKuioYXJjw5XDgSyQC+vMzmhuhuN+hWYU8Sp3WeFEeIgH2rBuDNFMmKkgEr/iGJ/ZVeQxTJ1OPPBdQjxmuhw11Qo+zZ/+L9hmIsnhEupLsTQ4ToB1z6PCHUkRTbZnyXTzT2/nIbFbUjvnCdP3U3LKrfL/7RFMvBydEq2aAXXDuT20yqW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66446008)(36756003)(2616005)(6506007)(66946007)(6512007)(508600001)(53546011)(8676002)(6916009)(54906003)(83380400001)(66574015)(38070700005)(122000001)(6486002)(26005)(186003)(38100700002)(5660300002)(76116006)(2906002)(91956017)(4326008)(66556008)(71200400001)(33656002)(64756008)(66476007)(86362001)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVNuVE5MZ3hVZkQ2TTAwQlgxREVoUFJ4Qmw2NGVHMkpOTEc0NHdRd0wrVHMy?=
 =?utf-8?B?aTVVbzhMekdjVkwrOFBiaUJPUkE2azY1bWlxVVM0bFVUSFBIb3A3cTJEUnJt?=
 =?utf-8?B?NG5PUGgvMnZITzVRVzVVdWM5WGdxNUVKR1ZYVFB2Z3AwYWwxcTE5dll0Z2tH?=
 =?utf-8?B?bGNtQVVkM01oa0xnb2oyMFJidlVxdzdiY1hBdVlRODVwUXlOazFCUUN3NXZl?=
 =?utf-8?B?Rzd1VWlqTEJrSy9HSDJITG9ZbkZ6SCtLQytXd3FoN29rNXpwUHR6NStBMngv?=
 =?utf-8?B?Z3k2ZllrbXFxNml0amdFOXkvU2QybEJsNWhxNmpOTTgvQmk1eUtPYUJaVDli?=
 =?utf-8?B?RWN0ZFpuL3NHd3NKcjRrVi9KUzVGRXY5NnZxTlJ6UnFLUENHUGhBVDdJTTB4?=
 =?utf-8?B?ZWxsTVBNSG4xeUhjakp3K2lzeHRjdkxRSjJHdVR3Y0ZTbkEwNmFnNUVPVmMz?=
 =?utf-8?B?am52cGpZaFNWYVArNkVCREFTZnFXZkY2eHhSU3FzZ2lXbXpiRlZuTy8wY0o3?=
 =?utf-8?B?MzdqdmhZdXpJZThwd1VFQUR0MW00UlVGTHdXV2FrbTAzenlvd29xdGpodzlI?=
 =?utf-8?B?Yi9hNHM3aFZoMFE3bExEYnZsT3RFdmV6MDYzV05TRkNrQ2gvb2MzMnljL0Jx?=
 =?utf-8?B?SEVGdEtuejQ5T2EvRkRnNmdpOURLMGEwOXJWeWR1dFFXZngvQWdmWnpEb1VO?=
 =?utf-8?B?MU1hMUtJS3h0aWkzaDZnZWxaSjFIdzlRZHhIWFo3TGllNHNTanNpWmJsZExS?=
 =?utf-8?B?N21ZVDhmaHhad3A0VDZubkxEaVQ0cjlpdi9XQTBDWkc2SFBlTkp5dmJVaVBL?=
 =?utf-8?B?WnRYY1J0RlNxME1xL3hUb1pPSmcrK2hVTzhkRnoweTRjQ3lJV3E0RUhVTE5p?=
 =?utf-8?B?V1E2eW5id3JibEhxM25EZWJoOVdSei81VVE0M3VMY1YwcXNkRmZiTGRONEw2?=
 =?utf-8?B?bUFTbXNZZGJDWDV0azh2TlhCNFNnWVhYRGRDUjYzMnBoTEZwaXpwZ09kT2xi?=
 =?utf-8?B?OEJ4NFZmTmNWMHFHSHUzbUlodk11VER3Wkt6VlJCN1ZETmdkNkxqOGU2V2ZD?=
 =?utf-8?B?aTZMbDBBK2Vsc01UK25jc1BqczNlWmxsZkFXRk15WSt2ZVR6dkZpS1lqc0hX?=
 =?utf-8?B?bjVYRHBwZGZIMnRvWis4QmdQc1FSa0p1cG1VVFoyTDJwMnpwaFcremJhVVlv?=
 =?utf-8?B?cXpsbmNoUHYvdzFSRnFzRm45OEJFMFdJOEIrcGFodU1zZEZDeUMwb1VLb1JR?=
 =?utf-8?B?N0d4S2NPS0dxN0IzdnhtdDVISEVDMEtPUmRsNEtzSk56ckQwd1R3VGlsWkFV?=
 =?utf-8?B?VUg5MG1UR09tRzhoMUtnZVFxN0lXWkVEbENJbW9ybTNlQ3crcUhIOHY0TXZu?=
 =?utf-8?B?Ulo0U3Vkc2JNY3hjNWFiYUJUZHhxWWF6akYzblZ5VUd1Zk82V2dTZ3NTSWtt?=
 =?utf-8?B?d0FFYkJBV1FzRzVlaytreDZETFVOaisySHA2Rm9QY1d2aGZKMDNpQWtnL2dV?=
 =?utf-8?B?YlplUDcxRU8rQUNWRHFBLzNsM2F1djZqTlpZcExzT09lMGpTQk5LVVB5dmo2?=
 =?utf-8?B?MmNzTERBTXJ4d1RPWFJXWUFEbmMxdkNidCtGcXREQkh1NFVDY3dhME8vd1dY?=
 =?utf-8?B?aHVmY2ZLMzVBOVlSYmk4eFVTeTNta1lBTHhKU0FuNTVqbkk3VWVFR2tWZzZB?=
 =?utf-8?B?MllseC81SnNyTFo2NnoyQ3pzWmFsL2k2b0NSYUg0SjZaWWtvMVNJQll6S09V?=
 =?utf-8?Q?6zrh1Ydiyr6uiRpG/BUhaQL5UGg/4Xw/cvOpb6W?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <275AABDCB548C840BF6A2E231A511764@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40051c38-da43-42a0-7dd0-08d98c260703
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2021 19:42:00.2178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wp5mG+mAHK2+yasVVhQlkaL741aH2Z3xK3aG281uJCZ4OT4vvzuy1FKnCfSg8jMOIXUjZ+SqDdw4QasH6BKWlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4146
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110100134
X-Proofpoint-ORIG-GUID: 2DwddVjCmhKTKdELoTToSxYrssya9-qw
X-Proofpoint-GUID: 2DwddVjCmhKTKdELoTToSxYrssya9-qw
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

DQoNCj4gT24gT2N0IDgsIDIwMjEsIGF0IDQ6NDkgQU0sIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4gDQo+IEhpDQo+IA0KPiBBbSAwNC4xMC4yMSB1bSAx
NjoxMSBzY2hyaWViIENodWNrIExldmVyIElJSToNCj4+PiBPbiBPY3QgNCwgMjAyMSwgYXQgMTA6
MDcgQU0sIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+
PiANCj4+PiBIaQ0KPj4+IA0KPj4+IEFtIDA0LjEwLjIxIHVtIDE1OjM0IHNjaHJpZWIgQ2h1Y2sg
TGV2ZXIgSUlJOg0KPj4+Pj4gT24gT2N0IDQsIDIwMjEsIGF0IDM6MDcgQU0sIFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gKGNjOiBh
aW51eC53YW5nQGdtYWlsLmNvbSkNCj4+Pj4+IA0KPj4+Pj4gSGkNCj4+Pj4+IA0KPj4+Pj4gQW0g
MDMuMTAuMjEgdW0gMjA6MDkgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+Pj4+Pj4gSGktDQo+
Pj4+Pj4gQWZ0ZXIgdXBkYXRpbmcgb25lIG9mIG15IHRlc3Qgc3lzdGVtcyB0byB2NS4xNS1yYywg
SSBmb3VuZCB0aGF0IGl0DQo+Pj4+Pj4gYmVjb21lcyB1bnJlc3BvbnNpdmUgZHVyaW5nIHRoZSBs
YXRlciBwYXJ0IG9mIHRoZSBib290IHByb2Nlc3MuIEENCj4+Pj4+PiBwb3dlci1vbiByZXNldCBp
cyBuZWNlc3NhcnkgdG8gcmVjb3Zlci4NCj4+Pj4+PiBJIGJpc2VjdGVkIHRvIHRoaXMgY29tbWl0
Og0KPj4+Pj4+IDU3Mjk5NGJmMThmZiAoImRybS9hc3Q6IFplcm8gaXMgbWlzc2luZyBpbiBkZXRl
Y3QgZnVuY3Rpb24iKQ0KPj4+Pj4gDQo+Pj4+PiBZb3UgZG9uJ3QgaGF2ZSBhIG1vbml0b3IgY29u
bmVjdGVkLCBJIGd1ZXNzPw0KPj4+PiBDb3JyZWN0LCBteSBsYWIgc3lzdGVtcyB1c2UgSVBNSSBh
bmQgYSBicm93c2VyLWF0dGFjaGVkIGNvbnNvbGUuDQo+Pj4+PiBJbiB0aGF0IGNhc2UsIHdlIG5v
dyB0cmlnZ2VyIHRoZSBoZWxwZXJzIHRoYXQgcG9sbCBmb3IgY29ubmVjdGVkIG1vbml0b3JzLiBI
b3dldmVyLCB0aGUgb3ZlcmhlYWQgc2VlbXMgcmF0aGVyIGV4dHJlbWUuDQo+Pj4+PiANCj4+Pj4+
IEknbGwgaGF2ZSB0byB0cnkgdG8gcmVwcm9kdWNlIHRoaXMsIG9yIG90aGVyd2lzZSB3ZSBjYW4g
cmV2ZXJ0IHRoZSBjb21taXQuDQo+Pj4+IEl0J3Mgc3RyYW5nZSwgb25seSB0aGF0IHN5c3RlbSBp
biBteSBsYWIgc2VlbXMgdG8gaGF2ZSBhIHByb2JsZW0uDQo+Pj4+IFRoZSBvdGhlcnMgd29yayBm
aW5lLg0KPj4+PiBUaGFua3MgZm9yIGhhdmluZyBhIGxvb2shDQo+Pj4gDQo+Pj4gSXMgaXQgYSBI
VyBvciBGVyBwcm9ibGVtPyBNYXliZSBhIGRpZmZlcmVudCByZXZpc2lvbj8NCj4+IEl0J3MgcG9z
c2libGUuIEkgZG9uJ3Qga25vdyBob3cgdG8gZnVydGhlciBkaWFnbm9zZSB0aGUgaXNzdWUsDQo+
PiB0aG91Z2guIEFueSBndWlkYW5jZSBhcHByZWNpYXRlZCENCj4gDQo+IHY1LjE1LXJjMyB3b3Jr
cyB3ZWxsIG9uIG15IHRlc3QgbWFjaGluZS4NCj4gDQo+IEZvciBnZXR0aW5nIHRoZSBmaXJtd2Fy
ZSByZXZpc2lvbnMsIHJ1bg0KPiANCj4gIHN1ZG8gZG1pZGVjb2RlDQo+IA0KPiBvbiB0aGUgbWFj
aGluZS4gSXQgd2lsbCBwcmludCBhIGxvbmcgbGlzdCBvZiBkZXZpY2VzIHdpdGggcmVsYXRlZCBp
bmZvcm1hdGlvbi4gUnVubmluZw0KPiANCj4gIHN1ZG8gbHNwY2kgLXYNCj4gDQo+IHdpbGwgZ2l2
ZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgUENJIGRldmljZXMuIFRoZXJlJ3MgYW4gZW50cnkgZm9y
IHRoZSBWR0EgZGV2aWNlIHNvbWV3aGVyZS4gTWF5YmUgeW91IGNhbiBmaW5kIHNvbWUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQgc3lzdGVtcw0KDQpGd2l3LCBoZXJlJ3MgYSB3b3Jr
aW5nIHN5c3RlbToNCg0KRE1JOiBTdXBlcm1pY3JvIFgxMFNSQS1GL1gxMFNSQS1GLCBCSU9TIDIu
MGIgMDYvMTIvMjAxNw0KDQpIYW5kbGUgMHgwMDU0LCBETUkgdHlwZSA0MSwgMTEgYnl0ZXMNCk9u
Ym9hcmQgRGV2aWNlDQogICAgICAgIFJlZmVyZW5jZSBEZXNpZ25hdGlvbjogIEFzcGVlZCBWaWRl
byBBU1QyNDAwDQogICAgICAgIFR5cGU6IFZpZGVvDQogICAgICAgIFN0YXR1czogRW5hYmxlZA0K
ICAgICAgICBUeXBlIEluc3RhbmNlOiAxDQogICAgICAgIEJ1cyBBZGRyZXNzOiAwMDAwOjA4OjAw
LjANCg0KMDg6MDAuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBBU1BFRUQgVGVjaG5vbG9n
eSwgSW5jLiBBU1BFRUQgR3JhcGhpY3MgRmFtaWx5IChyZXYgMzApIChwcm9nLWlmIDAwIFtWR0Eg
Y29udHJvbGxlcl0pDQogICAgICAgIERldmljZU5hbWU6ICBBc3BlZWQgVmlkZW8gQVNUMjQwMA0K
ICAgICAgICBTdWJzeXN0ZW06IFN1cGVyIE1pY3JvIENvbXB1dGVyIEluYyBEZXZpY2UgMDg1Nw0K
DQoNClRoZSBzeXN0ZW0gdGhhdCBoYW5ncyByZXBvcnRzOg0KDQpETUk6IFN1cGVybWljcm8gU3Vw
ZXIgU2VydmVyL1gxMFNSTC1GLCBCSU9TIDMuMyAxMC8yOC8yMDIwDQoNCkhhbmRsZSAweDAwMjcs
IERNSSB0eXBlIDQxLCAxMSBieXRlcw0KT25ib2FyZCBEZXZpY2UNCiAgICAgICAgUmVmZXJlbmNl
IERlc2lnbmF0aW9uOiAgQVNQRUVEIFZpZGVvIEFTVDI0MDANCiAgICAgICAgVHlwZTogVmlkZW8N
CiAgICAgICAgU3RhdHVzOiBFbmFibGVkDQogICAgICAgIFR5cGUgSW5zdGFuY2U6IDENCiAgICAg
ICAgQnVzIEFkZHJlc3M6IDAwMDA6MGI6MDAuMA0KDQowYjowMC4wIFZHQSBjb21wYXRpYmxlIGNv
bnRyb2xsZXI6IEFTUEVFRCBUZWNobm9sb2d5LCBJbmMuIEFTUEVFRCBHcmFwaGljcyBGYW1pbHkg
KHJldiAzMCkgKHByb2ctaWYgMDAgW1ZHQSBjb250cm9sbGVyXSkNCiAgICAgICAgRGV2aWNlTmFt
ZTogIEFTUEVFRCBWaWRlbyBBU1QyNDAwDQogICAgICAgIFN1YnN5c3RlbTogU3VwZXIgTWljcm8g
Q29tcHV0ZXIgSW5jIFgxMFNSTC1GDQoNCg0KPiBJZiB5b3UgdGhpbmsgdGhlIG1hY2hpbmUgZ290
IHN0dWNrLCB0cnkgdG8gcGx1Zy1pbiB0aGUgVkdBIGNhYmxlIGR1cmluZyB0aGUgYm9vdCBhbmQg
c2VlIGlmIGl0IG1ha2VzIHRoZSBtYWNoaW5lIGNvbWUgdXAuDQoNCkkgd2lsbCB0cnkgdG8gbWFr
ZSB0aW1lIHRvIGdpdmUgdGhpcyBhIHNob3QuDQoNCg0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFz
DQo+IA0KPj4+IEknbSBhc2tpbmcgYmVjYXVzZSB0aGUgcHJvYmxlbWF0aWMgY29tbWl0IGRvZXMg
dGhlIGNvcnJlY3QgdGhpbmcuIElmIHRoZXJlIGlzIG5vIFZHQSBjYWJsZSBjb25uZWN0ZWQsIHRo
ZSBkcml2ZXIgc2hvdWxkIHBvbGwgdW50aWwgaXQgZGV0ZWN0cyBvbmUuIFRoZSBvdmVyaGVhZCBz
aG91bGQgYmUgbWluaW1hbC4NCj4+PiANCj4+PiBCdXQgSSdsbCB0cnkgdG8gcmVwcm9kdWNlIGFu
eXdheS4NCj4+PiANCj4+PiBCZXN0IHJlZ2FyZHMNCj4+PiBUaG9tYXMNCj4+PiANCj4+Pj4+IEJl
c3QgcmVnYXJkcw0KPj4+Pj4gVGhvbWFzDQo+Pj4+PiANCj4+Pj4+PiBDaGVja2luZyBvdXQgdjUu
MTUtcmMzIGFuZCByZXZlcnRpbmcgdGhpcyBjb21taXQgZW5hYmxlcyB0aGUgc3lzdGVtDQo+Pj4+
Pj4gdG8gYm9vdCBhZ2Fpbi4NCj4+Pj4+PiAwYjowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xs
ZXI6IEFTUEVFRCBUZWNobm9sb2d5LCBJbmMuIEFTUEVFRCBHcmFwaGljcyBGYW1pbHkgKHJldiAz
MCkgKHByb2ctaWYgMDAgW1ZHQSBjb250cm9sbGVyXSkNCj4+Pj4+PiAgICAgICAgIERldmljZU5h
bWU6ICBBU1BFRUQgVmlkZW8gQVNUMjQwMA0KPj4+Pj4+ICAgICAgICAgU3Vic3lzdGVtOiBTdXBl
ciBNaWNybyBDb21wdXRlciBJbmMgWDEwU1JMLUYNCj4+Pj4+PiAgICAgICAgIENvbnRyb2w6IEkv
TysgTWVtKyBCdXNNYXN0ZXItIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0g
U3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtDQo+Pj4+Pj4gICAgICAgICBTdGF0dXM6
IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9bWVkaXVtID5UQWJvcnQt
IDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0NCj4+Pj4+PiAgICAgICAgIElu
dGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSAxOA0KPj4+Pj4+ICAgICAgICAgUmVnaW9uIDA6
IE1lbW9yeSBhdCBmYTAwMDAwMCAoMzItYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0xNk1d
DQo+Pj4+Pj4gICAgICAgICBSZWdpb24gMTogTWVtb3J5IGF0IGZiMDAwMDAwICgzMi1iaXQsIG5v
bi1wcmVmZXRjaGFibGUpIFtzaXplPTEyOEtdDQo+Pj4+Pj4gICAgICAgICBSZWdpb24gMjogSS9P
IHBvcnRzIGF0IGMwMDAgW3NpemU9MTI4XQ0KPj4+Pj4+ICAgICAgICAgRXhwYW5zaW9uIFJPTSBh
dCAwMDBjMDAwMCBbdmlydHVhbF0gW2Rpc2FibGVkXSBbc2l6ZT0xMjhLXQ0KPj4+Pj4+ICAgICAg
ICAgQ2FwYWJpbGl0aWVzOiBbNDBdIFBvd2VyIE1hbmFnZW1lbnQgdmVyc2lvbiAzDQo+Pj4+Pj4g
ICAgICAgICAgICAgICAgIEZsYWdzOiBQTUVDbGstIERTSS0gRDErIEQyKyBBdXhDdXJyZW50PTM3
NW1BIFBNRShEMCssRDErLEQyKyxEM2hvdCssRDNjb2xkKykNCj4+Pj4+PiAgICAgICAgICAgICAg
ICAgU3RhdHVzOiBEMCBOb1NvZnRSc3QtIFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUt
DQo+Pj4+Pj4gICAgICAgICBDYXBhYmlsaXRpZXM6IFs1MF0gTVNJOiBFbmFibGUtIENvdW50PTEv
NCBNYXNrYWJsZS0gNjRiaXQrDQo+Pj4+Pj4gICAgICAgICAgICAgICAgIEFkZHJlc3M6IDAwMDAw
MDAwMDAwMDAwMDAgIERhdGE6IDAwMDANCj4+Pj4+PiAgICAgICAgIEtlcm5lbCBkcml2ZXIgaW4g
dXNlOiBhc3QNCj4+Pj4+PiAgICAgICAgIEtlcm5lbCBtb2R1bGVzOiBhc3QNCj4+Pj4+PiAtLQ0K
Pj4+Pj4+IENodWNrIExldmVyDQo+Pj4+PiANCj4+Pj4+IC0tIA0KPj4+Pj4gVGhvbWFzIFppbW1l
cm1hbm4NCj4+Pj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+Pj4+IFNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4+Pj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQo+Pj4+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+Pj4+PiBH
ZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo+Pj4+IC0tDQo+Pj4+IENodWNr
IExldmVyDQo+Pj4gDQo+Pj4gLS0gDQo+Pj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+PiBHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQo+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQo+Pj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+Pj4gKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVu
ZMO2cmZmZXINCj4+IC0tDQo+PiBDaHVjayBMZXZlcg0KPiANCj4gLS0gDQo+IFRob21hcyBaaW1t
ZXJtYW5uDQo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4gU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KPiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+IEdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXINCg0KLS0NCkNodWNrIExldmVyDQoNCg0KDQo=
