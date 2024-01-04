Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1C8240FB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAB710E46B;
	Thu,  4 Jan 2024 11:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E579810E420
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:42:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 404BWN6t013253; Thu, 4 Jan 2024 11:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 qcppdkim1; bh=kYUOxafjESHpW/rQex1dfIGumDYRNKi4a3ymBztzm9Q=; b=jU
 UNO7ltLE2TxTd97M1Ab7uOwd8BBR6dbY9agSAoyC/yPFwEH1nHmHxFo4RPDhpyTp
 sebRZnmTOV0EHiqu51J7e69WvjsQLlz+0Cv2HVRPLbmhSp7Ofd0sogroi8+2xcTo
 7gF14mblBmRoPOZZi6T346G50WHzcSytuNPijNvaZiPZFP8J2luz4cGeWcr6Ljwt
 uH5wPA3gRGq5nQfG2rolh+et37pOIvtGeFzDudJPNDrPyQSmJqe/OrQvO5kV/STQ
 sqz6Lj1tCtgsDJmTdhJoHRJLG0bcocb/WAJHoF6z7WRTJ33noe7DupK62UBifIlL
 y78VufQ+Ws3dzvkF2FEw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd8s1jpc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 11:41:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2pO7TWkqazVjor+9051pUcdYD9FFsdeAjDaL08I3aXMd4PVaVdkguSTdzGQJKmND6Qs8i/uzkdYX/2Z5niQeLlCGA9uWi5EHH5T6HtZNg+tyvXNkprfb12+WRPo2nUuABlgc3zLblLjVIbAIVSwMJxQJEthlKnyk0Dr/MHH6TvCtkuJPTWBj7eOjOJmNMIXj+/2pFN1CwnzGTq7Ar2l7hqp4TxXY2CjJokkfsTnMftpVg0qK/G/e6+qTLKtpzGXyOaAhCfz2DHcMxSC+UgSrl700wjxVfSxQzedIukhuwkaq1JEA/3uvVE8cP0au9X+aeVEZdbaNAbMiBNlirGQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYUOxafjESHpW/rQex1dfIGumDYRNKi4a3ymBztzm9Q=;
 b=TJ7GExdVWBy1g9kShgDAdtgKoluKAPZ4h2hv56BUT7NF3RTd8cB/P4urylBZDWXcI8OzgjFz8wls+i9er20BHMazOXexbYn1LMRvd+nvxCuzbXOdI86jwpNExizKmlM/8ODKjNsVqrOGiYAlN28tzpsrHH+Uy7Rf5DHz72DaGWixovSFrq2AlSb079frIF9scRdeyHImDCx1PyG3kpspazZdTNuB84Imu8rHsEu8XYkk/+qda1lgxWUKNePNFIjegcqwBcfd8rwmpMKwq0VWmT4BQ+1PTZd7t90IoD6Rt/31fUP+fhAyRQvwlqZZw8wAy1n0dciuZYx8Y8VENcYFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL3PR02MB8234.namprd02.prod.outlook.com (2603:10b6:208:341::13)
 by SA2PR02MB7771.namprd02.prod.outlook.com (2603:10b6:806:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 11:41:19 +0000
Received: from BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013]) by BL3PR02MB8234.namprd02.prod.outlook.com
 ([fe80::6b86:dd1b:d3ae:d013%5]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 11:41:19 +0000
From: Ritesh Kumar <riteshk@qti.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Ritesh Kumar
 (QUIC)" <quic_riteshk@quicinc.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [v1 1/2] dt-bindings: display: panel: Add Truly NT36672E LCD DSI
 panel
Thread-Topic: [v1 1/2] dt-bindings: display: panel: Add Truly NT36672E LCD DSI
 panel
Thread-Index: AQHaNMcQSQvGaO5lN0uDf01M2QsoaLC1boiAgBQtVaA=
Date: Thu, 4 Jan 2024 11:41:19 +0000
Message-ID: <BL3PR02MB82343490A93C76C810CD391B88672@BL3PR02MB8234.namprd02.prod.outlook.com>
References: <20231222110710.19397-1-quic_riteshk@quicinc.com>
 <20231222110710.19397-2-quic_riteshk@quicinc.com>
 <34254cf6-346c-4b2b-a429-d9df153a58a5@linaro.org>
In-Reply-To: <34254cf6-346c-4b2b-a429-d9df153a58a5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB8234:EE_|SA2PR02MB7771:EE_
x-ms-office365-filtering-correlation-id: 2d333e7e-62fc-4ba8-d322-08dc0d1a1195
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jmi7o8vC3IZms/XsliwWpaXp86K243CjW4a5XBmw4qCN31knYcrEtmBiKmCqglj3q/4uMfVwxva24JnLLwqDbQ+x0pQUrQ5yP97xt63pb3dZRyEfYvRjAylFz6UWn1nZmk+purqPEjkgsiJ8n0093EGniYclhBeHeIfpolBNPumqnBmNZfWKYjdHjOv8QC3xpoBf6hCjQO9uD7yVumq8uVsW4BTFZudBI1TJti+pPXmE8goJN/HVGX+4BLIHNAv0rf9sfUrQaUGkkYk1mLDbENmJQYSWi0YL4x2hhN/ZL9koRC1CqBtWqSd03Z7J7LmLjyNxzKNydHxM6RES6/TJdprep4Ys5NkldIbK6mtnjrmBrx8YQmWblM7U/IlARBNLf5sYIfbWXjskMu+jqvLers37JKsHjh0whXvBsotKiQTIqDvhqg9zuDC6G0cwtBig9dj5dZfYSFCKLPyhaAWG5a49kEJ3JfZUUcRvG08Wnlfuf3YAPEZqqWe7ZLBYBf+yQytyLzVneCLDk6MQFwvbUAaDf2UwnOuExIQi384AqV5/P0wk/zzp9e/SMV0Cf5xUla77IYRE2st7BLSn3BxcQCqmh5qWv185LMzaYQaoWyuOLaibN5ZTzLbSJlxGLBmc2BbF0X8Ou7quMRSPYETKxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB8234.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(5660300002)(38070700009)(7416002)(2906002)(55016003)(52536014)(7696005)(122000001)(6506007)(9686003)(4326008)(966005)(8676002)(66556008)(66476007)(66946007)(76116006)(8936002)(478600001)(38100700002)(83380400001)(71200400001)(86362001)(54906003)(64756008)(33656002)(110136005)(66446008)(41300700001)(26005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d25tanBScWxzcHcyMWtQc1lSNk9jYkIwTy9JS1RibVFHUVk5TGcra2ZHNXpS?=
 =?utf-8?B?RVhyNE9RdDRJSU1wRWptczcrVHY2UXc5TWlSSWduVnJ5NnlNL0JDK2VMVVdp?=
 =?utf-8?B?WW8xY1NkT3BmcmlKaCt5Zm95UGl0WnRPN2F1b1RMOEFkQTJETExqZGc2cDFZ?=
 =?utf-8?B?ek1hcVN3bGZLajZRSXM2QTZYZ1RCVnJVcUpQL1NxZkh6UzdjbWVPNmxQZEcz?=
 =?utf-8?B?cDBZRWZwRmVRcVpOdUpiaUpBOWRwcjlaSXltTnZIanplWk5FY0hkZnVLL1lN?=
 =?utf-8?B?bGlGQmhjS2c2bjBHbThFNnBFYzdyTys3SkNZVTdkTWpXd3JMbHJSc1dLSUlF?=
 =?utf-8?B?SGx5ZFZpTExrdkovWVoxcFE5cjVlSVp4a3ZYUjZDZ1lOdTVHRWdlNHpYMjNR?=
 =?utf-8?B?c3hJVVlpc01EMlREYk5YQTg1K08rSjJhZis2SlVtb3cycUFKaW9CUnkzTDYr?=
 =?utf-8?B?L3I4VllmUHlJeXBzMThUNlhYZVp6d2lxbndRdzFlOURZMnB4cUxvT0NhZ1dZ?=
 =?utf-8?B?OElGWUt1K1ZUaDJrOHNGb3FNUHBOMGNQZTBlMk9jUzlqVnJVazBtK3daY1Q0?=
 =?utf-8?B?eTlqNGtHZ3cwQjZOMzd6eXRqTDMydWdRTFpwVVQzYUxzMzZTcDVhVlJVaVJF?=
 =?utf-8?B?Z0JKMytKY0Zabkl0ODBlVXovNjJobG93Q1JUKzVlc0tUNTExZXd6c2RBYXhN?=
 =?utf-8?B?SDVRL01OMmdOcElvMnl5RGRyNlpGblBiVkVTbTROL2N4cytFNGVpNzVRQ2tO?=
 =?utf-8?B?ZXg0Z0pLNVBzTUJiREhJWDlsY2hFcmo2Ulo4STdKbFRUdkRXZGY5Wi9IOXV6?=
 =?utf-8?B?ZHFJdSs4cGJDRnFPeHBGbXJlNG5mYmVnaVBxQk16VWs2eWpOVURVU2wxTURw?=
 =?utf-8?B?MVZ4d3hlOC9pL2lqZWlOQjJsNEtmS1Z0eGtsMVZCU2dNcTdSWnp3T2xaYXU4?=
 =?utf-8?B?Z0V1UXB0eVFCZTV1L1R1UGgxcGtYZ1VSMVQ2YnpyVjBjN3VLWEQvR1BtVkFu?=
 =?utf-8?B?elhtS004SXc4YjVoK2VQUzVLMXNTUGN6L3hnQUk5em44MTBxRCs3VmxTTTh1?=
 =?utf-8?B?SUtOQmtqaWR0cmdPZTBnRC9LSWJaeWVQTEJhSzM1ekp0TlQ4aUhzd2pRanZ2?=
 =?utf-8?B?SXFXSnNuWUdhTXlVNEZQZU5pZ0NUT1N4MEp3ZzNSM0hDNVVmdmxnOXFobHh4?=
 =?utf-8?B?SXl6eEpzdDU0cEpxcUlLMzM2LzJXQTRHSEhxWnpHSTVGY3E0MkZtNHNjNzVl?=
 =?utf-8?B?V1FwQzBWSHZKc1RDaGRHT0ZrUGpwbmkwakFqWGwvMUxDM1JjdWJNOURNSm5S?=
 =?utf-8?B?a09FbUhnQ3ByQlc3UEJDUklNTTI2Z1NRQjB5K0ZHcm1NTmdQWUk5R1VUVFcx?=
 =?utf-8?B?Z1l3aDJOUnJpMks1QWNlTXAvWHd4QUxGZnJGUWR5dDVTaWhvQU83cCsvUVgy?=
 =?utf-8?B?RXNsUklRTitYTWNKOE1mWFdXcVFQMWFPbkRrRzJBbkJwd1N3bFRNbVNXMTBM?=
 =?utf-8?B?YmNjRi9Jd0pTN21zUkl2MFVuUVQxYTZYTi9JcVJBcjdrYitVYVJtaDZEamhK?=
 =?utf-8?B?WTgycjdHaEcrby83eUNKbVJkUzR1N0Nwek5RYXA0V2NmZTdORnB5eFBYRlRB?=
 =?utf-8?B?WEwrdlRNY2poUW1yQW83cGdLeHpkK1NMZ2xrZ1ZCb3YvWFVMN1htUWNneWR0?=
 =?utf-8?B?clJmZGVWTE5idkd3STRZbHhxeU5xa3ZsbkpneHF6UThUQWZUenRJVVhXaTJY?=
 =?utf-8?B?QzZlTlJENDIrUFZxTmlTeTZ5SUhuendBalpPditEUkRsaXJIZmt4UFNodWdm?=
 =?utf-8?B?Vk0yZnZpaGxTdmplMFJDb3VoN2JlR3NZdUxKeTNHWnFpZFpvL0J2UDVFQ2tv?=
 =?utf-8?B?MFFidzl3azIvNEM3Y1B2dVBFOE5qaENNQU1NMWF2bzdnRG85MG11ZTJtVWVi?=
 =?utf-8?B?dVFxRnhNbDh5WVhMZGpGdWdFTENsN2NUSlYrUTdIc2liYmlBcTlsbkpCWENp?=
 =?utf-8?B?RE1ibzVIaEFYNkVPS3RCY3BKWGxYbkZwWUNCSUdyS2ZkbDhvY1hnZEN2TW5T?=
 =?utf-8?B?eXByWkZodFRuVkVLQ0RHL1ZnODRmWDFUTDBxQWxDVitkdURJOUlDTFp0elRY?=
 =?utf-8?Q?J9jE2OBksWf7RWl/GxrHNN38q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LZ62RvBhi2ACJZ1DGcZuhESLIB9aaxamOmq4UHiTtIGzKjOtT+hQPid4yCNetRU6qGtkOVWol30zseHODHuR5SYrSWIxxqPlHQ68hiiN1dknOMeTXKLZ13PvvkRvBdij0/OHirzYWi2pzMo3aaJ+gxBWYFcFYC/WcosGH0qWe11+2CXaO9/XDaneJ9m/TlE/CbQ09jzdyjg+HlOIWstQbXufXMXLhvOmfP8tvDGwyYmt3k73BwZEcayG1dvQXXijSoFK1aqvzFN4P4GcOloc19n+ybwrF/iNYK9PVv3onZvidBfc/doZJzVEK/msnoi/U/nFrt8T3tSfPzCwuGUVFba5WgmtTYQPWeki9oFd+wZLir+/tWqtkf3iax8Gf/ADtEdBCbZ//BOHgc5MPCDAU57EqtlSiJgImUwSjBe5cWl0sSdPReTUw5b3WqfrZ7D34O19k3cRu0jzZbxdqJq3uzKkqbW66ZmObaL0WACCa5JAY9ezgYauTNSHuIAOGnEz2dwVAoLQGD23NHHWfbnSk3chTozaZvBSnu6jVP0Mk8DeMMCkk7g4rPf+VcEMP+jhFU7RxalSLAJr0bHxdJadwxjlCaVKoLP6nmRWX3r0Sj2YdFSnNNVuw93brO2TxU5Z
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB8234.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d333e7e-62fc-4ba8-d322-08dc0d1a1195
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 11:41:19.4725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ho6Nm5SFvdLloVB7N8M8zqJGu5CUVpN5pDosGc1wHADmoDQeCxi6yYYtXFPVPEvnrLKEgkE1twecXYRmmFNwzh++fx60rp2Cpb9AS8gzUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7771
X-Proofpoint-GUID: 0bttEEAj7ha_2hbKgLnfyJoZi3X5VBp7
X-Proofpoint-ORIG-GUID: 0bttEEAj7ha_2hbKgLnfyJoZi3X5VBp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401040089
X-Mailman-Approved-At: Thu, 04 Jan 2024 11:50:06 +0000
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Rajeev Nandan \(QUIC\)" <quic_rajeevny@quicinc.com>, "Jessica Zhang
 \(QUIC\)" <quic_jesszhan@quicinc.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+U2VudDog
RnJpZGF5LCBEZWNlbWJlciAyMiwgMjAyMyA5OjAyIFBNDQo+VG86IFJpdGVzaCBLdW1hciAoUVVJ
QykgPHF1aWNfcml0ZXNoa0BxdWljaW5jLmNvbT47IGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj5rZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQo+Q2M6IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc7IEplc3NpY2EgWmhh
bmcgKFFVSUMpDQo+PHF1aWNfamVzc3poYW5AcXVpY2luYy5jb20+OyBzYW1AcmF2bmJvcmcub3Jn
Ow0KPm1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3Jn
Ow0KPnR6aW1tZXJtYW5uQHN1c2UuZGU7IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwu
Y2g7DQo+cm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+QWJoaW5hdiBLdW1hciAoUVVJQykgPHF1aWNfYWJo
aW5hdmtAcXVpY2luYy5jb20+OyBSYWplZXYgTmFuZGFuIChRVUlDKQ0KPjxxdWljX3JhamVldm55
QHF1aWNpbmMuY29tPjsgVmlzaG51dmFyZGhhbiBQcm9kZHV0dXJpIChRVUlDKQ0KPjxxdWljX3Zw
cm9kZHV0QHF1aWNpbmMuY29tPg0KPlN1YmplY3Q6IFJlOiBbdjEgMS8yXSBkdC1iaW5kaW5nczog
ZGlzcGxheTogcGFuZWw6IEFkZCBUcnVseSBOVDM2NjcyRSBMQ0QgRFNJDQo+cGFuZWwNCj4NCj5X
QVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1YWxjb21tLiBQ
bGVhc2UgYmUgd2FyeSBvZg0KPmFueSBsaW5rcyBvciBhdHRhY2htZW50cywgYW5kIGRvIG5vdCBl
bmFibGUgbWFjcm9zLg0KPg0KPk9uIDIyLzEyLzIwMjMgMTI6MDcsIFJpdGVzaCBLdW1hciB3cm90
ZToNCj4+IERvY3VtZW50IFRydWx5IE5UMzY2NzJFIEZIRCsgTENEIERTSSBwYW5lbC4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBSaXRlc2ggS3VtYXIgPHF1aWNfcml0ZXNoa0BxdWljaW5jLmNvbT4N
Cj4+IC0tLQ0KPj4gIC4uLi9kaXNwbGF5L3BhbmVsL3RydWx5LG50MzY2NzJlLnlhbWwgICAgICAg
ICB8IDY2ICsrKysrKysrKysrKysrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0
aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvdHJ1bHksbnQzNjY3MmUueWFtbA0KPj4NCj4+IGRp
ZmYgLS1naXQNCj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvdHJ1bHksbnQzNjY3MmUueWFtbA0KPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC90cnVseSxudDM2NjcyZS55YW1sDQo+PiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zOWFiMDVjNWIxMDMNCj4+IC0tLSAv
ZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3RydWx5LG50MzY2NzJlLnkNCj4+ICsrKyBhbWwNCj4+IEBAIC0wLDAgKzEsNjYg
QEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlICVZQU1MIDEuMg0KPj4gKy0tLQ0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvZGlzcGxheS9wYW5lbC90cnVseSxudDM2NjcyZS55YW1sIw0KPj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4gKw0KPj4g
K3RpdGxlOiBUcnVseSBOVDM2NjcyRSBMQ0QgRFNJIFBhbmVsDQo+PiArDQo+PiArbWFpbnRhaW5l
cnM6DQo+PiArICAtIFJpdGVzaCBLdW1hciA8cXVpY19yaXRlc2hrQHF1aWNpbmMuY29tPg0KPj4g
Kw0KPj4gK2FsbE9mOg0KPj4gKyAgLSAkcmVmOiBwYW5lbC1jb21tb24ueWFtbCMNCj4+ICsNCj4+
ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgY29uc3Q6IHRydWx5LG50
MzY2NzJlDQo+DQo+RWVlPyBUaGlzIGlzIGV4aXN0aW5nIE5vdmF0ZWssIGlzbid0IGl0Pw0KDQpU
aGlzIGlzIG5vdmF0ZWsgbnQzNjY3MmUgcGFuZWwuIEV4aXN0aW5nIG5vdmF0ZWsgaXMgbnQzNjY3
MmEgcGFuZWwuDQpUaGV5IGRpZmZlciBpbiByZXNvbHV0aW9uLCBwb3dlciBvbi9vZmYgc2VxdWVu
Y2UgKGluaXQgc2VxdWVuY2UsIGRlbGF5cyksIHBhbmVsIHJlc2V0IHNlcXVlbmNlLg0KTlQzNjY3
MkUgcGFuZWwgc3VwcG9ydHMgcmVmcmVzaCByYXRlcyBvZiA2MEh6LCA5MEh6LCAxMjBIeiBhbmQg
MTQ0SHouIEl0IGFsc28gc3VwcG9ydHMgRFNDLg0KVG8gc3RhcnQgd2l0aCwgSSBoYXZlIGFkZGVk
IHN1cHBvcnQgZm9yIHVuY29tcHJlc3NlZCA2MEh6LiBJbiBzdWJzZXF1ZW50IHBhdGNoZXMsIG90
aGVyIGNvbmZpZ3VyYXRpb25zDQpzdXBwb3J0IHdpbGwgYmUgYWRkZWQuDQoNCj4NCj4+ICsNCj4+
ICsgIHJlZzoNCj4+ICsgICAgbWF4SXRlbXM6IDENCj4+ICsgICAgZGVzY3JpcHRpb246IERTSSB2
aXJ0dWFsIGNoYW5uZWwNCj4+ICsNCj4+ICsgIHZkZGktc3VwcGx5OiB0cnVlDQo+PiArICBhdmRk
LXN1cHBseTogdHJ1ZQ0KPj4gKyAgYXZlZS1zdXBwbHk6IHRydWUNCj4+ICsgIHBvcnQ6IHRydWUN
Cj4+ICsgIHJlc2V0LWdwaW9zOiB0cnVlDQo+PiArICBiYWNrbGlnaHQ6IHRydWUNCj4+ICsNCj4+
ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4NCj4NCj5UaGlzIGdvZXMgYWZ0ZXIgcmVx
dWlyZWQ6Lg0KDQpUaGFua3MsIHdpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtz
LA0KUml0ZXNoDQo=
