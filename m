Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA7D332A9C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 16:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35EB6E0E9;
	Tue,  9 Mar 2021 15:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3F46E0E9
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 15:36:30 +0000 (UTC)
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129FUF5b014609; Tue, 9 Mar 2021 07:36:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=e08Z/7YaFbeRwiPwGY9lfuu8A/4Y7dqQbtp0Em4qf1o=;
 b=o86eAhn/vqyCGClxKwWBqD0OKUgU+DFkcN6yAzP0gX4/jdYl+yBX7UlPlChw7DxtlZPS
 9ZuXMcLG4ZmuiMTl6hagioFvvroYhnQ9aw1lSJzCDZWRQ1h3JK9dieyvmNOuL/1vSi+B
 7YYiytZaX5ZMR8S9TjulmAXsgfLpFVfCTzOdwV4or/c56eRxCC/SxzbB3v1D3e7EBXNA
 Zd6IQgyYHRjPrLeo6cp031/iGDdn0ddclMZVhukKjmZX/sYi8oMjQYYVEUHjmKhRyVaR
 Br1Shi87apV1HWt8+a3r8TPVSJV4g2tRKKJ03oyuF7+WOq2kaf1d7gUmb3GM0R6DlKff /w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by mx0b-0014ca01.pphosted.com with ESMTP id 37467519mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 07:36:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikDkhzrz0dhruESEm1YHuvrPKz2ASgkDv2jcmAbHdk1h8Ze3lXTckalYvs8CCfTUjBJ1jFD9tVl+HN4dwjEi6QFY2IS9DoyCsDJ9w87C1LC25u90hVy//nNQxqRD2rLD1xJDEwuYpcVL/shSH8UpOuQ3AkAK6Fz1KE6qY6vaFywmK0lG6lARr0V0cssr0HeqB5CjDAK9WXQ2SlWa70ILbwGLOS0Lc6Nwk/CKfVUUrZfBglL/ai3SKmaawl85LROr9WcgstvKVPBUyM5RWOCi2eZBfJs+r6BD8Eqcx/zEmJLDSDdLJPLkYBXo4zr4L8TKNV6/qa37ynFAi43T9R0SEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e08Z/7YaFbeRwiPwGY9lfuu8A/4Y7dqQbtp0Em4qf1o=;
 b=G4AnQUrPniGPoqKGyld9dmPq9yL8OroqZqEQFO04VospvSznPImT/dtooP+B1Q4dZx9GIx9YyUPPOwT90DLuVFJwv+uVfJYkzxGKewGgTn2BT00IBWEFXd4mPgE+d2G3mgtmlmx803X12U34GUKtHgzBmCs8P6X5rhUubv6Uvh6Wjywa6lXPIhr5N+KvTUltqrLOtOPzH0jMEDJsT2fsl7E2VX0AjZazJAOKIjhTIqhec/YQ3E5imiAN3i9MKmXNHoPsVOde7uOIPPos/NVKcGQXSta9nm/a161qz8pZ1GkDRPS7/0ZErvBR9/xNUMxA3u7+FUd/voQvH9HNLQ/XQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e08Z/7YaFbeRwiPwGY9lfuu8A/4Y7dqQbtp0Em4qf1o=;
 b=SKQW2Lbt9xwQEk5VUJDry7kYbcXd7mU1Q3hKZ/nI1LSG+MtpucRwUzP28WVjoyARVfjAghp3XOyXohdBa+euDC1h+SnOq06kUNwMD1/k/F0+IUQIlMHjrfGdX/G/bMp+TKLDz4KQ/TydxxihnKOk9ccJqDNhIVAoZnIuYZooRWw=
Received: from DM5PR07MB3196.namprd07.prod.outlook.com (2603:10b6:3:e4::16) by
 DM5PR07MB2923.namprd07.prod.outlook.com (2603:10b6:3:d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Tue, 9 Mar 2021 15:35:51 +0000
Received: from DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::3160:6a62:6e4d:2226]) by DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::3160:6a62:6e4d:2226%5]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 15:35:51 +0000
From: Parshuram Raju Thombare <pthombar@cadence.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: MHDP8546 bridge binding
 changes for HDCP
Thread-Index: AQHXDo0sCc9s3aGgTUeo76y9eToCYap6ZfmAgAFv0VA=
Date: Tue, 9 Mar 2021 15:35:51 +0000
Message-ID: <DM5PR07MB319651C165C4165A0D39131AC1929@DM5PR07MB3196.namprd07.prod.outlook.com>
References: <1614597685-4192-1-git-send-email-pthombar@cadence.com>
 <1614597746-4563-1-git-send-email-pthombar@cadence.com>
 <20210308173615.GA2668115@robh.at.kernel.org>
In-Reply-To: <20210308173615.GA2668115@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccHRob21iYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0xZTI3NTlkNC04MGVkLTExZWItODYyZC0wMGUwNGIzNmI1YjFcYW1lLXRlc3RcMWUyNzU5ZDYtODBlZC0xMWViLTg2MmQtMDBlMDRiMzZiNWIxYm9keS50eHQiIHN6PSI2NTEiIHQ9IjEzMjU5Nzc3NzQ3Njk4MDAwMSIgaD0iZ2FHaEFDcnhsY3BXb2dlSFpHUVRhZzRQdEJBPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7ac37fc-c312-457e-34dc-08d8e3110561
x-ms-traffictypediagnostic: DM5PR07MB2923:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR07MB2923EEFA3A9B04F455498146C1929@DM5PR07MB2923.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GrYC5UOA3SSfMfIIRiqKfISI+/5kCqOWndHsaAlVJ6/bsrkyRMjYpeKvhlnwiPcmXTO2tTgt8NJJDlLueULXhNYg8zOvD04wFCGrils2pm/QxFm6lgUP1oa77UMCBhaqDqPh2uJ7yFIcChpXphXhkTXqAuJQd4QmWP66ci1SVkJytbuL2jDcR1eGNcK61GcC039qawQijHcbUWpOf4cw5hDibSztp7QTqLMRx0NX+zdbjBMGUieX5LpUIqksviJW4UTgXi2BQIJTCSjtPFw4P84hHjzjhdfJSz8x4sL4klQJaRu8CbafDuT9dD3jcvJUcHyaoDFn07WPhbkQ2l1HiRhsf/6XbR0tHKpi76d+9xnYPBYrNhFacb3O0LqTJhM9M7jttYDkI4s/9M996kmxvV4Rz1CG+Fc8MJYl9r2RTFBw+DOTC1U8wlLg/tSYTH3VMR+0MEbaVSkFl8ARNrYgTMcY0uE29zqkUNnB636NobMC7eeY00ZitCHYL9SOWyl7deK++jOXgu+JZXAMEZtoerDRAqecLcJ9w63Ltcp4JI0ji/c82/Ensm4ajpZnDLhKxl//RnsdKPMuK9ac6L8kaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR07MB3196.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(36092001)(7696005)(71200400001)(66476007)(66446008)(316002)(8936002)(86362001)(186003)(54906003)(2906002)(4744005)(6506007)(5660300002)(107886003)(26005)(4326008)(52536014)(55016002)(7416002)(66946007)(8676002)(478600001)(33656002)(9686003)(6916009)(76116006)(66556008)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?auxh13H9XF9ujfRIPafiZMmup3+OD4PVkLeCcQTOKx9voNTsbGSzs9MNdcWa?=
 =?us-ascii?Q?pHfrTWUmSstpclF/TO9e6D1tdRj8/W62IqgbOyGShoGfxvEwiQ1wJx3T9uOS?=
 =?us-ascii?Q?mYAgvkBNfpLuNJ9kGSzEzuwfcDtYQFFxEZ4XxHc7mqTy/mQPnOllia57xPoH?=
 =?us-ascii?Q?HxB6N45sil9P/Hw4HLTOU4omJIZxXGjBxslA20gpha5HOmn1VJ+MvJpYl05A?=
 =?us-ascii?Q?nFhg4lZXHJ/QQ/EvZkPd0MMXd+P7PKVlRnX/nGsrmN6v2EopG6DBxM/PBoYN?=
 =?us-ascii?Q?WxIghcgFs/1vjAGZyh2rDBIJgXt4+BhEi1WEgnnqbDTwrqIs8gmtFTAGllJj?=
 =?us-ascii?Q?SB5+fdj9t0yKsoAqvimZcgYgqwmBWxYNd8E+S7JjPDG0dUpCfkym1ScjbiCM?=
 =?us-ascii?Q?l+TE39h/PsN6OdE5twfuyHU5L8sYS8Vv9/8yIzFpC8DlWLIfzVyPAdsDv825?=
 =?us-ascii?Q?uA0CKvH9ax1zt0bXNLz5T77qmp/qNtLGVwHvVDn4IbqAdQY6leR6TtlIoPhN?=
 =?us-ascii?Q?WJkrvjxDOzGE9i9GlcZst/rAcBdthxCpYIiXgDrNelCSSSKz1UrbcBboUKsK?=
 =?us-ascii?Q?cUYrWyHCjsI/btxHs739wWpZJS/KF/sOWvrranTNPl7rH69R+s64wdQfGEEY?=
 =?us-ascii?Q?hf31oHA4fDwZKTg1xMvWvPGlwekzbIaMHjkRYmahslxsgqPcJTTdAAFVkJ4P?=
 =?us-ascii?Q?fZG+3MoO8awAP7Oyj2lvUvJjHIHxWA8hf6wyl5hdsGhloA04wUPacl42kzkv?=
 =?us-ascii?Q?DrDY2K1fCGb8Su5qoaVATNfU5IfeYa9mRVBkMCRrIIkZVl9E5LdnM6ciZOYP?=
 =?us-ascii?Q?cY/sVQsJtbvMzrUIrCXSlY2o/DRtPL2XgDvRkYNMnbtKgqBnZwllaphoFScY?=
 =?us-ascii?Q?UQOorLCJkyUrq4eHF4gpJPETiIi9dvLa03AFtC6fecWTjANE4Hv6NDjog6kJ?=
 =?us-ascii?Q?jJv3oRU45zwyIbnzvb/YQ2uRvttMcz3NpzMjQehMHJr2mXy/Nx+gG+MzJao0?=
 =?us-ascii?Q?VOhGNPX5C8hTJxskJl8l5sDieoqJQ1UozjwtdRu4SAadRhA12WJ+n8+ocJRI?=
 =?us-ascii?Q?fmT1pqGTxjCG8ruHORw/rxAQEb5R9wOnS40maqFJMpnyOO+qvUHmRbfcAD31?=
 =?us-ascii?Q?89GaZqCvrgALIq9bd1YnnjXGSMTIvv+vVEvk9vx0EbxYCXYRFkpVVRt4NfAn?=
 =?us-ascii?Q?OnO38at9c1M4KWoBDVVaenKZ0z667ycHLPmieRjpQ4kZpJ01waZXc/mlaPJv?=
 =?us-ascii?Q?CDtObKOR+vjro1Zdg4g+K7VZsPt7WkHdOeH6/chSq/HizVO3hskzxadXO7ds?=
 =?us-ascii?Q?z76wqPPnXdSi3smAkPntRpe8?=
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR07MB3196.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ac37fc-c312-457e-34dc-08d8e3110561
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 15:35:51.6331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNl+4l5uN66L0cfsmsQecUVEFSRrmrwOplmkMecRJmLPrHj3U+EVtvDxVNepVw4pt6YMHxOmAcZB4eDd3IHerfEmA+hqIiO7pHKdjoudvNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB2923
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_13:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103090079
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kishon@ti.com" <kishon@ti.com>, "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>,
 "nikhil.nd@ti.com" <nikhil.nd@ti.com>, Milind Parab <mparab@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for your comments.

>> Add binding changes for HDCP in the MHDP8546 DPI/DP bridge binding.
>> This binding is not used in any upstreamed DTS yet, so changing
>> index of property 'j721e-intg' should not affect anything.
>
>TI folks might disagree, but weren't Cc'ed.
Kishon and Nikhil from TI are Cc'ed.
Hi Kishon / Nikhil, 
Do you think this can be an issue ?

>In any case, it needs a type and constraints on the values.
Ok, I will add type and constraints on the values.

Regards,
Parshuram Thombare
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
