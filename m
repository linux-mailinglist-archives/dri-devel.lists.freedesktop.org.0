Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0DA7B10FC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 04:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6647610E087;
	Thu, 28 Sep 2023 02:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8C10E087
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 02:52:33 +0000 (UTC)
X-UUID: 0f4aa9a05daa11eea33bb35ae8d461a2-20230928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7iiE32/p2gfnj+1YjvZanUcsnOB9PwnRuh4bvWbhxNY=; 
 b=HEGFhUcmiZprzk99ixtxcPDYiQyB2/KmHauR8AZ5cBffYwo49pq7PNDb6znC5fjnPV9TeLiHla4cWWYvkPltNe9M7bp2y/evnmtMTYjEz7QV3aNUBY7JP6tyMzeqd6UNOvsaDri2I4laBSonZvvhra1rGmfaMHToPPq+/CgIAew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:8b64a6f8-a115-415c-9943-0d97acc53621, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:33f88cc3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0f4aa9a05daa11eea33bb35ae8d461a2-20230928
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1685660570; Thu, 28 Sep 2023 10:52:27 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Sep 2023 10:52:26 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Sep 2023 10:52:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SquclcbE12YzyqQ4SnAWkZHSetIETx20UjywVV1/ArHjGw7gMKNJb6JNY9tN/DXECvjD7FN1WPL6Q62voDbSm2i6gmM6jY78Dy5F7xiSC2lwMGFYvPCbiOqDS3rnUGBK72YXz5VaTPss9X8KHdAfD1MptiYxKqGbxlKS4v1sQIfdny/Ruiz/j/sN+d7qkwPo3Z1sfmVOWyhAqDR9PcBLuKz8fAZ0HhMv6+UjerY4cG0dbpgF5TNyoactZO0+QilNbiY2V+3PkO0Qpta6OYkLWI93IDC1FNNP4M+BXMjLtqp0JR3a/c6WMZsaFfv2tMq+PsftQhiMo+qVIqHudHyjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iiE32/p2gfnj+1YjvZanUcsnOB9PwnRuh4bvWbhxNY=;
 b=WQLH6UvP5CVeiYIW2gcJ6i3Baij//uVpthJt8u9TloQ2thovKtjOVkjAVZdJpjOQdprqYPMCWM1j6YxGsq5pS+yLhtyIcJo+Gc9Z5xGK4b1F2V8cuBLdEuYVRgVtwZ9GsuumIgKUe5NHsbJb0u8DVpthveI52mag7gc5toQWGb+tmm7q4vFEJun1Ob5AFAWhdR/JIhYNIl/fv2q22nXkyOKHpkxvH2dGpdxiKDA5RWmScowb5/wEnpHxtM1yGcIiyMwBa7C8djDpgOsK4dbuL9oW9Vr7hE4xG4mDJd/OFG8L6gCS7a2zkGiNSjomwri1Vn3QDeHFmirqOhVTETVJTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iiE32/p2gfnj+1YjvZanUcsnOB9PwnRuh4bvWbhxNY=;
 b=MjPXtCxFNdvCifplsKTHS+UJuTzndpoW5rqZl0ltKhSjEanybMEPpvvGMbBNGfu/nSJ9ZZZ4kLGUEaQda6xVQfNEVTKTn4mwfCZAKbzwmt4XmzoweWw4qX4AtnwFTZ6i7ngRuYKtf+rBSJfLWa6erb8aCNH2d0RQ90TvVXueqFs=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by TYZPR03MB5438.apcprd03.prod.outlook.com (2603:1096:400:39::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 02:52:24 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::2d8b:d64e:65cb:b7af%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 02:52:23 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "conor.dooley@microchip.com" <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Thread-Topic: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Thread-Index: AQHZ7SWDmGuBlsrdL0eRbWKT0x+2ILAm/mEAgAAAgACAB0y5gIAAKWwAgAEeSgA=
Date: Thu, 28 Sep 2023 02:52:23 +0000
Message-ID: <825ac03b692043d48563620ad9542a4ee43211e7.camel@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
 <20230922-overhung-deception-e9b461ba0372@spud>
 <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
 <20230927-crunching-prancing-36fe3eb79607@wendy>
In-Reply-To: <20230927-crunching-prancing-36fe3eb79607@wendy>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|TYZPR03MB5438:EE_
x-ms-office365-filtering-correlation-id: 989c91a1-6d36-485d-d2a3-08dbbfcdf116
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HSbgUUSA6p1Z+niVg/sMH1GAMqCjdBjDr/LgkmLe99exb9o4L/UNj6lTK1VxQ3v26878+kaKo44R1LAQ9n2zrlcFp5jW2yAGg/0ICG2CtE8boi7XBI6jvKYKthgNrFqfM+JLJ8cS9me2vz+bOsqZiim8738XcUBrQhzytRjeHmtRaBrIcg9kTC2inZKi7QqcgkbpBRStWx1tV2HHCHZZgwvJ+EqVEFcW+lo09wLpu67uEbGfhm6z7RVpQj6VAtcMsaFyAGgSYyBw+yOs+cb0yYXVvbEmiFIz2U962gUL5eSTRzVfgUKkV3kSP+xzLprnJbODfJGqp5Ahk+0b1nzD0rntE8dgZQP33R6CMUTozQq7/L/Z/Zy5z7pvkvcPWoY7nxYvNc/t80/wZABuijOz8KeABDTgdCNkSqJwhA1R60Z/QLPiFh18UlWwUUu132NLSrbiHY9htH9UXgG1VanVaMFy2tISsOVL/pZSkimkiAX2cqM5Dq7RxQc1N3LLjavQyAVgwvxmqB6OGM1UuZWmGkMhIz8rxldGZIYP8GBIDXzeXctYERsucPNdydvg5qliB7Vqon2g9ezb+597kZQLVDsIlWJV8vo6YKLm3sx7/L/rHC+vfLu639IS4tXKYXSRZIKHM8yPEZhjg6TklwE3YS8lNbWNvbjFGTED/txUeNQBqb6W/aC0kbKIyIpx82Lt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(7416002)(8936002)(4326008)(5660300002)(8676002)(316002)(41300700001)(6916009)(6512007)(66476007)(64756008)(66556008)(76116006)(54906003)(66946007)(66446008)(2616005)(86362001)(71200400001)(478600001)(26005)(38100700002)(36756003)(38070700005)(85182001)(6486002)(6506007)(83380400001)(122000001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THQyQWRBK28zZGplbHdoSmdYQXRobDRlTHJNeFhWR3ZSc0N6SzAyN29NNlJp?=
 =?utf-8?B?cVJmSzk1N1d3MjRZUlE3N09mYzl2WnkxZkUxWjNIVnNlNHdKU0hLN21IQzFj?=
 =?utf-8?B?NGtMMlV2djZPZldlRWdrWW1QZGd6OEZxdm43dW9tdmtuaTQwRGxrWVdsdm54?=
 =?utf-8?B?MExyY1AvN0luUlZtZEYya3MwVkI3VkZEaW1oNzNYeVl6STRLaVFTTEppWUxY?=
 =?utf-8?B?S1ZXTnBRSEZid1JOeWM4czdseUt3Uk1QY2l0SzhmbEhhc1N4RCsxbEJZOFZx?=
 =?utf-8?B?UUVMOXBUL1FXcEtMOFlBUFI4S3NQNS9idXVTMFhNUm5zUE5QeHY0STVFUDA2?=
 =?utf-8?B?a0VBSjBkYjF3cXArLzhYTFpwUE96dlZ3ZDNCWXg3VGhVRWlseUltL211K0p0?=
 =?utf-8?B?NHBsNTJiRUhiNm9hTERJRm55enJMaEdEWkxCZjdBdG5ObzNFUnRUYVYzb3hL?=
 =?utf-8?B?bVMzVmx6cHZuQXdCcGVZSktnb3hqZ1pndk5FdnlQb1FyOXIyMjJyUWNjSjVB?=
 =?utf-8?B?MEZMRXg5STIwWUNuMVFNSVZwTEhzK2xBRW9HaXVpdlNTTTRpYy9hNGJtNjR6?=
 =?utf-8?B?UHdqV2JTeHRiV1pRWUI1dmpjSWJVZFhRc0o4OS9zWi83bjIycDFndnFsazNt?=
 =?utf-8?B?S0VKTVJXK1pKK2RYV2NpVGgvelNGWk1jUEwxcXp3U0xyZ3lPK0VtZzRQUXpG?=
 =?utf-8?B?OGFyQmZ2T1RlY3F1V0RjbXgrWUdFV0VpQVE1MFZUWXJGY3hBVjBpL3NEUmtN?=
 =?utf-8?B?ektoWVdudjZJalk1UDdwekxMTCtJZ3VBUnpYQmxFTTl0ZHEwY3Y4OG5CclJl?=
 =?utf-8?B?d2tDay9nam9sWGVUajRYVnNDYmVwTDAremhwSnM5WkowRDlUT3U5b1dhbEtm?=
 =?utf-8?B?K3V2R2hQR0RSdWJsUkIrQ2MwMnlhOTVhV0d2WXNORHpKMGVXT0NaZGxuOWtY?=
 =?utf-8?B?MWxQRlNMTTBPdDM4bnZ4S3VCREM5RFdJNG1QQzVWMG8rUmxUUTR6MUlnMTV1?=
 =?utf-8?B?eXl0WSsvajM3M1lSQXRrWXVPV3Vsb0hpaHVNY0ZCRytaSFlkVkxOcVNOakVE?=
 =?utf-8?B?S0xvMEZxbWVTV0RZd1p6Q1hDWU0yMmtINlNLeGtwbkFuczRBZVdFRFpkTUQ4?=
 =?utf-8?B?cFNsRTFNSzExSllMclJCOEptdTliL3FzY0p5a2NVaW1OU21hMS9JQkhPbjVh?=
 =?utf-8?B?Q2NOY05qaWZSdnZ4NWhoRHZWZEFPajdxa3VGOW96UmowODMrL0MyWWFWbjA4?=
 =?utf-8?B?ejRIOC9hL1FWditycDlrNkNnMGNmQlZBN015alRzeGVKeGlkRWdQLzFrSUhO?=
 =?utf-8?B?d0NRYysxT3MxS1NBTXJxNlFtY3RDa3I1KytwMkc3R2tZZkNFSEc5eXhKTWhF?=
 =?utf-8?B?U3hDeUZTU2R1bkYrNDFhSkIyU0o2ak9ySWpPdVIrc1NxUmVKcS9YdGxUdzBO?=
 =?utf-8?B?M2t2bXV1QlR1cEMySXBWVzh5bE52OVBCWVc3eGI3VDBlRnlmZnQxdUhwS01R?=
 =?utf-8?B?K25GOExmRnBlVXZTc2pWM0h5TUhWQnJiVE5KcnhZRkZRSWhvZXpMTmIva0hn?=
 =?utf-8?B?M3JPcVhDVXJORnN4MjV4WUtNWlVyRFZDeGMzY25ycEpzRDM3UFVBRTRlMGdi?=
 =?utf-8?B?c29wY2FveS9mT2t2MXNpQXFxeVh1bU5CanVnaERrMnhrTG5kSlNPSkpSUXZW?=
 =?utf-8?B?VExCa2ZxYmZzbW1KNm5XQTlrZldFTks2WHFXdTIrMzVRTGtTUGxBN0tCTXA5?=
 =?utf-8?B?Yzg1dVFySXpaeXVlTVlwajl3TXhaVUk4KzFQQzZMYm5nQWNiM2V1Q0lza0Vn?=
 =?utf-8?B?TzBGOXR2MlAzK1NZNXFQbmtybFNZNjBVc3NpcHo4RkcvNFpScUdYV0g1bW9p?=
 =?utf-8?B?THMrcXh6QSs1TUJsOUlvdGMvQlVDeW92S010MVZ4U2NZTzZjNldFVS9lSlRJ?=
 =?utf-8?B?eU9YNDY0QlJMTlA1VHo1c05tWklTR25ONVFkZENQUi9ETjNDVStyUDFjeWVi?=
 =?utf-8?B?VmQ0TDRXK3BIQlhlSVlycHdLNlI5cEdrSmtwMjllSnpCcUNSend6cTZ0V01l?=
 =?utf-8?B?LzVZL0FDMmNLRVBiWTdQN2NGeE5OZnBxMXBoeE51VG1DV1RNREhXNzBJVTlT?=
 =?utf-8?B?cFlUeU02ZGJPNzRETld5WkhuckNDc2Q5cnJIS01aaThxUXZtZDZqVVpuOXR1?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1865A6E6995F743B3F0E1709584A871@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989c91a1-6d36-485d-d2a3-08dbbfcdf116
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 02:52:23.6455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcPaDG+DcXL43iKZmFahE+7itqoVmtJ8K05NpD9FmpqUaF8deTNEETyKgBEN03p6oTRswiLxqODUYxcd6qR8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5438
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--15.921800-8.000000
X-TMASE-MatchedRID: 3FtKTYP2XG7UL3YCMmnG4ia1MaKuob8Pt3aeg7g/usCe9toQ6h6LE9yi
 JF4Y8A5b0W/jG0/KDRLxHXxxAO/d2Ws/tFw6ZTQWeUyVZX4ivrvg/EG5TeijVbUpYagt6jzoNE7
 kMskA+NvTRtQAQ4mUj3NRC/B3kD0DT8iNcToosvz0mf9msa5zwQKdh+kSDJQ4VUwmVL0cK7OE6G
 Ij3Iz11XZVUWe9wUukMuf7R1rpdO68IKanJHvnZrMjW/sniEQKQa2sDHLkQ05OY9DrDI/ROi+8O
 xujShyxWsDmTSqMTwf3vf+ggwV/depLXJKeenhQEroQVzSW9XTUqhJbkmLVe7c6v3/B0U2Do8WM
 kQWv6iUVR7DQWX/WkT3Al4zalJpFvECLuM+h4RB+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.921800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E9B1A1EFC326B34E404C03AD89A2CFEC42C457F453B30E485512A079595C256B2000:8
X-MTK: N
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor@kernel.org" <conor@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDEwOjQ3ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFdlZCwgU2VwIDI3LCAyMDIzIGF0IDA3OjE5OjI4QU0gKzAwMDAsIE1vdWR5IEhvICjkvZXl
rpfljp8pIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAyMy0wOS0yMiBhdCAxNjo1MSArMDEwMCwgQ29u
b3IgRG9vbGV5IHdyb3RlOg0KPiA+ID4gT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMDQ6NDk6MTRQ
TSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiA+ID4gPiBPbiBGcmksIFNlcCAyMiwgMjAy
MyBhdCAwMzoyMToxMlBNICswODAwLCBNb3VkeSBIbyB3cm90ZToNCj4gPiA+ID4gPiBBZGQgYSBj
b21wYXRpYmxlIHN0cmluZyBmb3IgdGhlIENPTE9SIGJsb2NrIGluIE1lZGlhVGVrDQo+ID4gPiA+
ID4gTVQ4MTk1DQo+ID4gPiA+ID4gdGhhdA0KPiA+ID4gPiA+IGlzIGNvbnRyb2xsZWQgYnkgTURQ
My4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8bW91ZHku
aG9AbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwNCj4gPiA+ID4g
PiAgICAgDQo+ID4gPiA+ID4gIHwgMSArDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrDQo+ID4gPiA+ID4gLGNvbA0KPiA+ID4gPiA+IG9yLnlhbWwNCj4gPiA+ID4gPiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrDQo+
ID4gPiA+ID4gLGNvbA0KPiA+ID4gPiA+IG9yLnlhbWwNCj4gPiA+ID4gPiBpbmRleCBmMjFlNDQw
OTIwNDMuLmI4ODZjYTBkODllYSAxMDA2NDQNCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
DQo+ID4gPiA+ID4gLGNvbA0KPiA+ID4gPiA+IG9yLnlhbWwNCj4gPiA+ID4gPiArKysNCj4gPiA+
ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrDQo+ID4gPiA+ID4gLGNvbA0KPiA+ID4gPiA+IG9yLnlhbWwNCj4gPiA+ID4gPiBA
QCAtMjYsNiArMjYsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+ICAgICAgICAgICAgLSBtZWRp
YXRlayxtdDI3MDEtZGlzcC1jb2xvcg0KPiA+ID4gPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxt
dDgxNjctZGlzcC1jb2xvcg0KPiA+ID4gPiA+ICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxNzMt
ZGlzcC1jb2xvcg0KPiA+ID4gPiA+ICsgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtbWRwMy1j
b2xvcg0KPiA+ID4gPiANCj4gPiA+ID4gSG93IGNvbWUgdGhpcyBvbmUgaXMgYSAibWRwMyIgbm90
IGEgImRpc3AiPw0KPiA+ID4gDQo+ID4gPiBJIGRvbid0IGtub3cgd2hhdCBtZHAzIG1lYW5zICYg
Z29vZ2xpbmcgZ2l2ZXMgbWUgbm8gYW5zd2Vycy4NCj4gPiA+IFdoYXQncw0KPiA+ID4gdGhlDQo+
ID4gPiAiZGlzcCIgb25lIGNvbnRyb2xsZWQgYnksIHNpbmNlIGl0IGlzbid0IGNvbnRyb2xsZWQg
YnkgbWRwMz8NCj4gPiA+IA0KPiA+IA0KPiA+IEhpIENvbm9yLA0KPiA+IA0KPiA+IE1lZGlhdGVr
J3MgTWVkaWEgRGF0YSBQYXRoIHZlci4zIChNRFAzKSBpcyBhc3NvY2lhdGVkIHdpdGggTU1TWVMN
Cj4gPiBhbmQNCj4gPiBhY3RzIGFzIGFuIGluZGVwZW5kZW50IGRyaXZlciB0aGF0IG9wZXJhdGVz
IGJldHdlZW4gVkRFQyBhbmQgRElTUC4NCj4gPiBCeSBjb250cm9sbGluZyBtdWx0aXBsZSBjb21w
b25lbnRzLCBpdCBjYXJyaWVzIG91dCB0YXNrcyBsaWtlDQo+ID4gY29udmVydGluZyBjb2xvciBm
b3JtYXRzLCByZXNpemluZywgYW5kIGFwcGx5aW5nIHNwZWNpZmljIFBpY3R1cmUNCj4gPiBRdWFs
aXR5IChQUSkgZWZmZWN0cy4NCj4gPiBUaGUgZHJpdmVyIGNhbiBiZSBmb3VuZCBhdCAiZHJpdmVy
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21kcDMiLg0KPiA+IFNpbmNlIHRoZSBzYW1lIGhhcmR3
YXJlIGNvbXBvbmVudHMgYXJlIGNvbmZpZ3VyZWQgaW4gYm90aCBNRFAzIGFuZA0KPiA+IERJU1As
IGNvbnNpZGVyaW5nIHByZXZpb3VzIGRpc2N1c3Npb25zLCBJIGF0dGVtcGVkIHRvIGludGVncmF0
ZQ0KPiA+IGludG8gYQ0KPiA+IHNpbmdsZSBiaW5kaW5nLCBuYW1lZCBhZnRlciB0aGUgY29udHJv
bGxpbmcgdXNlci4NCj4gDQo+IEknbSBzdGlsbCBraW5kYSBzdHJ1Z2dsaW5nIHRvIHVuZGVyc3Rh
bmQgdGhpcy4gRG8geW91IG1lYW4gdGhhdCB0aGUNCj4gaGFyZHdhcmUgY2FuIGJlIGNvbnRyb2xs
ZWQgYnkgZWl0aGVyIG9mIHRoZSBkaXNwIGFuZCBtZHAzIGRyaXZlcnMsDQo+IGFuZA0KPiBhIGNv
bXBhdGlibGUgY29udGFpbmluZyAiZGlzcCIgd291bGQgdXNlIG9uZSBkcml2ZXIsIGFuZCBvbmUN
Cj4gY29udGFpbmluZw0KPiAibWRwMyIgd291bGQgdXNlIGFub3RoZXI/DQo+IA0KDQpIaSBDb25v
ciwNCg0KU29ycnkgZm9yIGFueSBjb25mdXNpb24gY2F1c2VkIGJ5IHRoZSBzb2Z0d2FyZSBpbmZv
cm1hdGlvbi4gSW4gdGhlDQp2aWRlbyBwaXBlbGluZSwgYWZ0ZXIgZGVjb2RpbmcsIHRoZSBkYXRh
IGZsb3dzIHNlcXVlbnRpYWxseSB0aHJvdWdoIHR3bw0Kc3Vic3lzdGVtczogTURQIGFuZCBESVNQ
LiBFYWNoIHN1YnN5c3RlbXMgaGFzIG11bHRpcGxlIElQcywgd2l0aCBzb21lDQpzZXJ2aW5nIHRo
ZSBzYW1lIGZ1bmN0aW9uYWxpdHkgYXMgQ09MT1IgbWVudGlvbmVkIGhlcmUuIEhvd2V2ZXIsIHRo
ZXNlDQpJUHMgY2Fubm90IGJlIGNvbnRyb2xsZWQgYnkgZGlmZmVyZW50IHN1YnN5c3RlbXMuIFRo
ZXJlZm9yZSwgSSBpbmNsdWRlZA0KdGhlIG5hbWUgb2YgdGhlIHN1YnN5c3RlbSBhZnRlciBTb0Mg
dG8gaWRlbnRpZnkgdGhlIGNvbmZpZ3VyYXRpb24ncw0KbG9jYXRpb24uIElzIHRoaXMgYXBwcm9h
Y2ggZmVhc2libGU/DQoNClNpbmNlcmVseSwNCk1vdWR5DQo=
