Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596A77738A9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070E210E0BA;
	Tue,  8 Aug 2023 07:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Mon, 07 Aug 2023 00:54:27 UTC
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1516.securemx.jp
 [210.130.202.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EDA10E04A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 00:54:26 +0000 (UTC)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 3770mWwg021444;
 Mon, 7 Aug 2023 09:48:33 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 3770kjfR165871;
 Mon, 7 Aug 2023 09:46:45 +0900
X-Iguazu-Qid: 2yAbM4uBQs72JvGtQg
X-Iguazu-QSIG: v=2; s=0; t=1691369204; q=2yAbM4uBQs72JvGtQg;
 m=kgN2dUVvFRQ+c+CiDQd3U0Gmmow5MyrWP7JPMO8i/iU=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1800) id 3770kVuC2778128
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 7 Aug 2023 09:46:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGsVZci9eC2KiNeYVvWFZc14ENTeNFFd8JgDTMtEbC93HiXF+8SIHIeUR7gc5DOFgZ0uIdxPc5bYJa5hc3IyjriVBrXdXcz7DVS5erCaLWr14ZKUqnJuy6qJWTQCzZOMpWilCAy/5KOYtAlaobG4w3qqsYHvjfJTY0IcgYhhZqiOC4O7xxFafsBxjmEXVeKLxun/5AiIMwf+I1FYNyCFWgds103bTwV/sgmMGZxBY8UKXFhZTOh0Uv26w/7P4htk3xeeeKZK7zFNaUQ5OV2I7dVah3eXzqBKOBuZdzMWKTlzKDnjodW1MR+zyhNi2Lau4XFKmMLvWjw3HjogeoB2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmlVcp/nJHdL+ideVRUfJHoNO7rffrKyMrVJ3dGWORQ=;
 b=Ct5p0+5oTPtymapLsYAG3O4q+AiDgxpY9EjdOD6hoKC0hyp9wKcb1UTf3e3xPof45sDG70ZNj13gDq4F0HUu++bbyxG5kV0irZhnR6MrAdu417bAKzsy5iP10vj4gQSYY5ZMvDu3izLx+OugxXFUokvM250wXoX9tG3pOjRxIxySDQNMAKTdjsteO5sXBV2l5hCpU1sIowuKR2e0rfCQ5U+SRCnZAqTIcgD7T/uiSXh/6M2mqV7CyVzkyjbPhimBm4RLcDoko5WxanUlP3vqIA5wPvrrPeheZjzTBG+ZTGdK71dotcasquNgDhctx8TA7xYwwo/AcIhN64M5y18Qrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <nobuhiro1.iwamatsu@toshiba.co.jp>
To: <u.kleine-koenig@pengutronix.de>, <thierry.reding@gmail.com>,
 <Laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
Thread-Topic: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for
 drivers
Thread-Index: AQHZxt/9rzh2lixcHUWwJjEI7Tv9T6/eAw4g
Date: Mon, 7 Aug 2023 00:46:27 +0000
X-TSB-HOP2: ON
Message-ID: <TYWPR01MB9420275DEE9D8E68EE79FE6C920CA@TYWPR01MB9420.jpnprd01.prod.outlook.com>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9420:EE_|TYCPR01MB9554:EE_
x-ms-office365-filtering-correlation-id: e987abb3-52a5-4649-7486-08db96dfbb8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: izKuq1nmeJVt/HOHsJcvqLAo59nGd3/Cr/uUPRvJ7CUJmNuslh9nRF3LYst1NhbXwp/weOFThIqlvWTER9qERQLsw5jhDxoNvvMP0GDxTqL1PojMuz+JAuYxl747W/KWsTTC6GHPR7PnwNy8pk8NInytVh6OQbhoh27+R5ZYCW/DHN8+gBZIVKoA7PfE1GyQQAsl6baXLEtWLClNRh1xJikOS7Jj2whQcVK/TMEMEn3bhknYD4xK07H16zt20VtcfWk0jr/X6pum62MSI0z/lxs4tdWN9GN/UQ//OS7UaDw9XFh6hr3+rfiZvjYLh2cZWwJuQ8cTi1HhdBoaZMS908UdbXVhq5dHWGbumDrU/cYCijyTeVbxJZBVex9IwR+8QW01+iUQkcwx7ZlCb6oiHOfhAzI672dZ4IpKVgAPtuiDOXesmpCFl/BI5LFidDiXacy1SqGJijVic4FI1tETSp1/0GyuxUho98PeJzFMVq8Yhzlss4v68tbqdkq5Y/WxJTiOsPyzta8zTbUP0PVdEym97nv1BZ/PtSVehxqcrf/qm1IJXhVw3QQPQtg8LOfxYnbfnFRB2QW5jlc/9NM9SxqwM4IcsDwmTjAFIgnjz1L7oZ0m+U8aLUVAc8QfafmQqTsxVEWJ+lesTV1hM9caJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB9420.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(1800799003)(186006)(66556008)(66446008)(76116006)(64756008)(66476007)(4326008)(316002)(66946007)(41300700001)(2906002)(110136005)(54906003)(478600001)(6506007)(7696005)(9686003)(7336002)(71200400001)(26005)(53546011)(7416002)(7366002)(7406005)(8676002)(8936002)(5660300002)(52536014)(33656002)(83380400001)(38070700005)(86362001)(55016003)(122000001)(38100700002)(241875001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3pPTlRyS3ZRZ045QUtxQmYzUDd5d1BnbEE5ZFo3dWRzcXQvcHRoZDFDNlAr?=
 =?utf-8?B?L1htSGlRdHR1dVFDUGhvQ0hnc1dUczZIOTdSLy9KT2I2YldYOWg1eURkVHZw?=
 =?utf-8?B?U20zZS9HSWpJeWRXVkVmWmNxTlFWRndTYzBnM1paTkxMRXFKUXlmc2RTaDdJ?=
 =?utf-8?B?OVJTVGJlbFN0S1diY2NYMjdhdzZLaVFSUnlvTm9sWkVDcXlncjEwZ1BaTkJv?=
 =?utf-8?B?Y3djVHJWRk5pYTU5VC90bVplWHNQK00xV0g2S2w4SW4xNjVsM21tYnBzUGpo?=
 =?utf-8?B?Y2Z2UW56ZHVicXVCNEZPZmVkRkVBTkx4WjE3eE9LQXBidFRDZ05zWGJZZnhm?=
 =?utf-8?B?aldvbXZFUWZMUXcwQzF1bXI0bXQyUEdKY3lFZFVLWnppczNnYXk4V3IrVEFl?=
 =?utf-8?B?S3dSNXVRVzZTb0JqNkVOVlgxbXMyZm5vSjF2LzJMWEhSWVRTWEl3RkNOZi9E?=
 =?utf-8?B?bE90SFpGZThsakVDRFllRWdJUG11NlRBTlcrcEt1dTJ0SGplcUNYcDkrQWgw?=
 =?utf-8?B?L2kvUEIweXFIakhvSTF3MVdEcTBHdUFyWXprZ2xhYkJSWGQ4Sk4wekI0c1lD?=
 =?utf-8?B?M05oeGtUZDlIRDN3cUxtdm1HZVkrU09pUmQrcy9aeGozU3dNNVJ5eUJoZnFP?=
 =?utf-8?B?WVU0eXowdXlqTnowY2o5ZjY4Vy9KYllBMW5DM2lFT1c4YSt0WkdHUUVGSnlB?=
 =?utf-8?B?NmZZMzRZTmFqS3V4MDFraGRZYVhLQUo4OXpkUHZ0YzRHSmxQaVV5SUpsL09S?=
 =?utf-8?B?dnowbzZ0WUNCVFNhYnIrblNiVmlzL2NBSXM4SXQ3QXNvRStTV0swL2srT0RL?=
 =?utf-8?B?VEZFTTFrSGVJYU5WWlFqZmRiQjNDTHUzYjhqMXhYbG5MWk8vTHdnZGI5bHk2?=
 =?utf-8?B?ei9neGRmdm5XQS8xcUY0WklmaTFHMitUbGplaHBTcTFnTlVNQ3N1QVNOR0VP?=
 =?utf-8?B?c0s0L1p4NW5KbU55QUNld1ovNmxKb3YzM1NyOE9XODBMTkFIN2VwRmZDM0dX?=
 =?utf-8?B?TGwxbDFKQTR5WHNWdm9YbDhZSnJXRW9ITjZYTWJqbndmb0NoZHAxdHc0OEJ3?=
 =?utf-8?B?QTlsdmtOQ2tPNE1tcDdNdjFHRnhRUUdNQWFlMlh4bnVrVnJzRHRtallnbTFH?=
 =?utf-8?B?UnJPdkl3ckZzSW5FYXE3dEZ3S3BmYTdubjl3WHZJSWMrWXIwbllkMGltRWVh?=
 =?utf-8?B?VjVBZ0ZVdWlqNkFkOTR6Y045Y1JWcFd5c2hvSmh2cERCZExLaDRWTHYydzdG?=
 =?utf-8?B?UjNKWXRPR2V0R1g0Znp3dUk4ZFpycDlLcjZBQUtZMmpkdytERE1sY0w5alRO?=
 =?utf-8?B?RzlsVUZNakRNZjFyMmF4ZTJSWFdOTjBTaHBFWVJDOUFubWhBM2l6VGp5cHpJ?=
 =?utf-8?B?KzZVWFg3dHM3K2Z0eHFMWjRQVHBZNTREQ0dRRFJzZEZ6QWVYeXliMzVtMW9z?=
 =?utf-8?B?anFqUWxIaEMrQkNxQkttZFJ2OUV5MHhBUDgwTHF2MFR5ZkVWdUtwVDlJMm1R?=
 =?utf-8?B?VStDckYzeTBDK3B4UDJ2KzRBd0g3ZUhYUkhwWVoxZDV6YTJ3dU9Lb3R3RDBq?=
 =?utf-8?B?djR1QzVWOVdTN0xxeFlYK0xFTkd2N3pwWEgwbmwwTGtiaFpCTHRZWm4zbkVJ?=
 =?utf-8?B?ZWlzNjBLN0lzc3c2VG1HbFZOSFlKSEFFTEFxaFl3N3lNaFV4disrOU9ZR01r?=
 =?utf-8?B?SmM5K2Y0NXRRQjREUWRUb3ZFUndpZUpYVU01SmxDeEhWN21mc3FJY0FMTUtK?=
 =?utf-8?B?MmhtZklyUnNiL2d3YWkvUVZZaUFMbGVVS2xuOXhmdU8rUlRQdTdxZTRvNHRZ?=
 =?utf-8?B?S2wzc25rWExobnkxMTBteXlpaXdDNE9aN1kwTTROeUxGVENqcldsUXRmTkEw?=
 =?utf-8?B?SW9TcHJ4TTcycEV2Z05ITU8xMnRoVk5ydEl1MW0rWnpKNWNzWGtiWHphK2s3?=
 =?utf-8?B?QjlBQ3RDZ2ZXZ2NnZUhZT054eTAycE9IcFJlVnR5Y2syTFVqNWZ2OTBuQzV2?=
 =?utf-8?B?c2ltWHNHVCtpc1ExWkZBV1dIQmR3eXNDcnI4VlcwM05QL0FvRnh4OEdKRTRM?=
 =?utf-8?B?aXBEYXAyemVLZExkdEJQeHdqUlNHMk1RVkJKMkNQN2cxOHFMTWl2UEpNdHpM?=
 =?utf-8?B?TXd5YUs5ZXlyWXFlWHBRVW05RnZsaHVQZFdhTEdSZDNHRmZXaDc4VFcrSlNt?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?U0MzeUZBaFBiSTcvRDBBTGd4VXNrVm5kZ3BZYzU2N0s3MEdST2thRk9CcWhN?=
 =?utf-8?B?VitIWXFLMXBaZXkrWUpFam5uNlZIWjJIVG1iN2llMXBiZy9laHBVOVlRMlRB?=
 =?utf-8?B?OGtXM09Nd2FkL0VBYW9jU2dFemxXVUF4UGJVZXc4UmhiM2V3Tk1NL3NvT2U5?=
 =?utf-8?B?M2VlZXBndGJIblVYQkc1UUNiR2YzVTVMOU5KSnNuN0NNN2tva3p4Ykdzdkw5?=
 =?utf-8?B?U1h2V1d1VGhVbGhoWTFUaFJLek9xYnZNT3ZBVmkrNGJ6amREMXc3QW5YTTY4?=
 =?utf-8?B?UW5IK2lscktBTEhVcGhqTkd2cVJqamVibkdMZWFFT3h1aEt3Tk11OXVnZk9P?=
 =?utf-8?B?SXUwbFREZk1LQlM3QktJcDRVaXNhMkdYVGYyZUhzVnd1YnRWWjhmWVh6TzJB?=
 =?utf-8?B?MmM2cTkyZ2gydC9GcTNubG93clhaVDUvQXM5UzBNMi9sZm02WGVtSTZzSk5a?=
 =?utf-8?B?Y1pqRXBEZjdtTmFBck1rWUpkZUozZFBhby84eW9OSFRyTGtWVG1OOUc5V2Rq?=
 =?utf-8?B?TDVGci9Ha09IOE15OFpuTUJXOTkwRWhpeEp2aVRrbHNOZ3hzTUhaSW9yNDlx?=
 =?utf-8?B?V2lyc013WjEyWEdMWng5ai9wRnd0MXhDdWNmR0Y3NjVwYVhJN1ZaVFN5YkFI?=
 =?utf-8?B?Q0tWUi9nZFhWQ2Y0cDl0Vm5Qc3Fna2piWkFjb3dNemNoU01hNVNjWW1LYWN0?=
 =?utf-8?B?d09ZYzZva0hrbDBDeTFWM3pveG8zK1lpVXZ6R3FmYnNORjhjeDl3OUNaVTAx?=
 =?utf-8?B?NnBRSVFTRXVzK09vblJibVVsS1k0UUhodzJiZUwvT09Ea3Z4TnB6Smc2TTlK?=
 =?utf-8?B?bG1mNHlJQVVZQmVLOGl3bjRuQ2thbG42S2Y1ek1YL1JQU25nS0UzUlBnNjZQ?=
 =?utf-8?B?ZmdweVAwREowK2h2Yk9QNnFNc2UwU0JxZk5kcjdKdUwxMTlNQ3Z3TXh5dmx5?=
 =?utf-8?B?OHZ5ZnNqemhUMGZ0TVdqQ2ZnV2pyVmxHaVE5UVZTM1FtdHZDak5FYkdWWjE4?=
 =?utf-8?B?N2pSN3FCaFl4T0xEUUVjcnJoR3lNWDV0N05kNXJhM0ZiLytFaDdtb1g4N1Mx?=
 =?utf-8?B?YWs3Y2pSZGZsQnlPb05jb2FuR3FUY1laUzRSclBmVFlZTGpOdnpKUWx3TFh1?=
 =?utf-8?B?OUROMHZhOTJuSTlZNmtxbHUwazZvRHZRL0VrT2xYY215c2RFS3l5RERha1lV?=
 =?utf-8?B?YUh3d3BqSTUyb1k2QkFKRjl6Y1RYS0JvRHI2VjE4QU8yeUhhOGpPYkM5MXNy?=
 =?utf-8?B?ZWlrWG56MWJmWmMvTS9SUzNiT2pFd2ZxTmx0V21PMm5qbTdIUTZLM0F0YWtX?=
 =?utf-8?B?TVdjaVhlcTJ4RUprM1ljK084Y0R1R1o5dE11bjkxM1pTR3BqU3FPZEYyRjhM?=
 =?utf-8?B?YzlaOXRmZFZ1S2NBQjVOMzRjVndXTjFYYXFidm14WjhrQ3c5OTNiMXVteDNw?=
 =?utf-8?B?dkVRdk1EeUg4dkNDT1ZKUDJzaVNzb2ExMzF3ZWR2eU0zZjUxbncreDl5L3Zs?=
 =?utf-8?B?djdHaytsQW96T2lRR1NDVDEycGlRMXBnMkZkakRucTlFeFN4R1hJcS9OMEVX?=
 =?utf-8?B?Yk9SZ2ZqRGN0bloyRlR0Uk11WFl0TVFPSjV0Z21YR2NzMzE1WE9lTkp3aFFE?=
 =?utf-8?B?Sk8wMFozajBDSTF2OWZQNnJXYS85QU5KWVVOZmxsUGhZUFZLWnorb0Y1NS8v?=
 =?utf-8?B?NDdJRTdzMUJ0MVhKY29wemQrY25lTm1uTjRld21uTUZ2UHRKZ2lnemZSaXE2?=
 =?utf-8?B?eXkxazNTT2FoUlN0L1JqdktzU3NOMFBKNjNJNFhIajhodzNLbDVVK1B0Y1V0?=
 =?utf-8?B?a3JJcnd3d3BteWVGT0ptMEVGd2YzQS8ra0lPZzNJK0pKZzFQenlhaG5wSFFq?=
 =?utf-8?B?U3AwQVFLOVg0akp5ZnBNc1N0WnpkMHU4SW1PUTBqRjN2Nm1TaHJ6a2sybDJz?=
 =?utf-8?B?VDZEQzlGL1BEUU5ZN04zZ3NGUFpwTGc3aGJsejJzeTNKWnhvdUVTbmkxdHRF?=
 =?utf-8?B?dHJqOWVnL2NGWEFkbzdNS2ZJdjZYelZxL0IwNjk4eSt1ZmM1a0FER21aR1lh?=
 =?utf-8?B?YzQ3SmwxRFRkVnBPUnJEQjAzRWtvNlh6eHpIMFdjaTRqY1dRZDZlSW9WaTds?=
 =?utf-8?B?clBaRGdrMVVoZnY5Wm9jWDlkOTFNYU5jdWsxUGJpbGw2ZGY2bUJ3ZEdXczFq?=
 =?utf-8?B?ZW5vdmIwMXhDdmM1UWtNaGZ4S3BaZWtNbUdrVUxBYllLVjQyOS9KSXJ6RmxL?=
 =?utf-8?B?SEZTcVNRSWFsUG5kTnJKTHg4TTFkNWtHbTFsbHN6WkJIMWZJajEyOUlaelBs?=
 =?utf-8?B?dlBDUTIzQU16UlAvWTFwOUhZWHltSDZPcEd1Y3VvYlZIUFU1RFJvWTY5MjZm?=
 =?utf-8?Q?LsGMtyfyM8kKzh/Q4h8DX3KXoLEK9styhObG2QG2b/V92?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: OyX75RbbnCV4aBCUbviiY5Wy5PW5tNnC7cASHzWnO/yVZaunY21dQKIJu/F68sTsvO9MDCLwoSMdAz9AaAe3W09f4reZ+19VvCuzthkRwWoT3Pfi82Yrwev9QAYEGMwO4u6/J0wUPU7nP3yAsHEOolCjrJZ8p5ySjJOzIoUDE7sgAKkERe6yvObv2WcscZS///giPF5rM2dgSq3SlFVrODnqMtBO+nXXNFS+N88tvRfYcsiNJF0rLuxl/odM4rbHJnLJCOhDAe2PIsv9JM/+fTTG8Nndt2jtdbElgwD6JBr4QKhYvLNLHgeTHvTBzqqhwASdM7eMunMOPe4zz9rvpoamPKvmrPjs6/dhHAc7dJIyxtAF88hNNgBTuPHWryA+lAhscsX3NuaxfXUAVQHc6dyRzichAe+sv4nfoYo0dJXmg3QRAiiZJ/MlmcKOfERfVqRfpDNKOyyJxatL0FSt38lNnQBQsDhrBzYevKE2KUcEtoCBAmMmNdkEUAJ3sE5J9obc4RH4MXulrY5I74XEigt6c3CHJ7lzY1Y=
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9420.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e987abb3-52a5-4649-7486-08db96dfbb8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 00:46:27.0808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QX8qs0eEVY+masL+cPpF84CCSP728TBziblWOUrcvq1+hw93plctqiLGXkFNP3QLq04zhRoSq0MSkLJMaqPPioaGjZ0MfUPME1YiDSTOINdGaS5Xn3CyfeWTYDpoZmo4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9554
X-Mailman-Approved-At: Tue, 08 Aug 2023 07:40:06 +0000
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
Cc: alexandre.belloni@bootlin.com, linux-staging@lists.linux.dev,
 andrzej.hajda@intel.com, gregkh@linuxfoundation.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, paul@crapouillou.net, linux-tegra@vger.kernel.org,
 conor.dooley@microchip.com, pavel@ucw.cz, linux-amlogic@lists.infradead.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev, johan@kernel.org,
 michal.simek@amd.com, linux-riscv@lists.infradead.org, alyssa@rosenzweig.io,
 jbrunet@baylibre.com, luca@z3ntu.xyz, linux-samsung-soc@vger.kernel.org,
 rfoss@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 florian.fainelli@broadcom.com, samuel@sholland.org, sean.anderson@seco.com,
 brgl@bgdev.pl, lee@kernel.org, michael@walle.cc, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, hammerh0314@gmail.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 linux-leds@vger.kernel.org, orsonzhai@gmail.com, alim.akhtar@samsung.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 mcoquelin.stm32@gmail.com, linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, martin.blumenstingl@googlemail.com, rjui@broadcom.com,
 s.hauer@pengutronix.de, j.neuschaefer@gmx.net, vz@mleia.com,
 linux-gpio@vger.kernel.org, fabrice.gasnier@foss.st.com,
 linux-mediatek@lists.infradead.org, baolin.wang@linux.alibaba.com,
 sven@svenpeter.dev, paul.walmsley@sifive.com, matthias.bgg@gmail.com,
 quic_bjorande@quicinc.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, andy@kernel.org,
 neil.armstrong@linaro.org, elder@kernel.org, shc_work@mail.ru,
 sbranden@broadcom.com, greybus-dev@lists.linaro.org,
 daire.mcnamara@microchip.com, zhang.lyra@gmail.com, marcan@marcan.st,
 dianders@chromium.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com,
 asahi@lists.linux.dev, khilman@baylibre.com, dmitry.baryshkov@linaro.org,
 shawnguo@kernel.org, claudiu.beznea@microchip.com, quic_amelende@quicinc.com,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVXdlLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQo+IFNlbnQ6IEZyaWRh
eSwgQXVndXN0IDQsIDIwMjMgMTE6MjcgUE0NCj4gVG86IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5
LnJlZGluZ0BnbWFpbC5jb20+OyBMYXVyZW50IFBpbmNoYXJ0DQo+IDxMYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+OyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxicmdsQGJnZGV2LnBsPjsgQW5keSBT
aGV2Y2hlbmtvIDxhbmR5QGtlcm5lbC5vcmc+OyBEb3VnbGFzIEFuZGVyc29uDQo+IDxkaWFuZGVy
c0BjaHJvbWl1bS5vcmc+OyBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47
IE5laWwNCj4gQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgUm9iZXJ0IEZv
c3MgPHJmb3NzQGtlcm5lbC5vcmc+Ow0KPiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+
OyBKZXJuZWogU2tyYWJlYw0KPiA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgRGF2aWQgQWly
bGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IERhbmllbCBWZXR0ZXINCj4gPGRhbmllbEBmZndsbC5j
aD47IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PjsgTGVlIEpvbmVzDQo+IDxsZWVAa2VybmVs
Lm9yZz47IEhlY3RvciBNYXJ0aW4gPG1hcmNhbkBtYXJjYW4uc3Q+OyBTdmVuIFBldGVyDQo+IDxz
dmVuQHN2ZW5wZXRlci5kZXY+OyBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhQHJvc2VuendlaWcu
aW8+OyBOaWNvbGFzDQo+IEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+OyBBbGV4
YW5kcmUgQmVsbG9uaQ0KPiA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+OyBDbGF1ZGl1
IEJlem5lYQ0KPiA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT47IFJheSBKdWkgPHJqdWlA
YnJvYWRjb20uY29tPjsgU2NvdHQNCj4gQnJhbmRlbiA8c2JyYW5kZW5AYnJvYWRjb20uY29tPjsg
QnJvYWRjb20gaW50ZXJuYWwga2VybmVsIHJldmlldyBsaXN0DQo+IDxiY20ta2VybmVsLWZlZWRi
YWNrLWxpc3RAYnJvYWRjb20uY29tPjsgRmxvcmlhbiBGYWluZWxsaQ0KPiA8Zmxvcmlhbi5mYWlu
ZWxsaUBicm9hZGNvbS5jb20+OyBBbGV4YW5kZXIgU2hpeWFuIDxzaGNfd29ya0BtYWlsLnJ1PjsN
Cj4gQmVuc29uIExldW5nIDxibGV1bmdAY2hyb21pdW0ub3JnPjsgR3VlbnRlciBSb2Vjaw0KPiA8
Z3JvZWNrQGNocm9taXVtLm9yZz47IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz47IFNh
c2NoYQ0KPiBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJvbml4IEtlcm5l
bCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIDxmZXN0ZXZh
bUBnbWFpbC5jb20+OyBOWFANCj4gTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+OyBQYXVs
IENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD47DQo+IFZsYWRpbWlyIFphcG9sc2tpeSA8
dnpAbWxlaWEuY29tPjsgS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT47DQo+IEpl
cm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPjsgTWFydGluIEJsdW1lbnN0aW5nbA0K
PiA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT47IENvbm9yIERvb2xleQ0KPiA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+OyBEYWlyZSBNY05hbWFyYQ0KPiA8ZGFpcmUubWNu
YW1hcmFAbWljcm9jaGlwLmNvbT47IE1hdHRoaWFzIEJydWdnZXINCj4gPG1hdHRoaWFzLmJnZ0Bn
bWFpbC5jb20+OyBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubw0KPiA8YW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPjsgSm9uYXRoYW4gTmV1c2Now6RmZXINCj4gPGoubmV1
c2NoYWVmZXJAZ214Lm5ldD47IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+OyBLcnp5
c3p0b2YNCj4gS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+OyBBbGlt
IEFraHRhcg0KPiA8YWxpbS5ha2h0YXJAc2Ftc3VuZy5jb20+OyBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQGRhYmJlbHQuY29tPjsgUGF1bA0KPiBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUu
Y29tPjsgTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz47DQo+IE9yc29uIFpoYWkgPG9y
c29uemhhaUBnbWFpbC5jb20+OyBCYW9saW4gV2FuZw0KPiA8YmFvbGluLndhbmdAbGludXguYWxp
YmFiYS5jb20+OyBDaHVueWFuIFpoYW5nDQo+IDx6aGFuZy5seXJhQGdtYWlsLmNvbT47IEZhYnJp
Y2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPjsNCj4gTWF4aW1lIENvcXVl
bGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPjsgQWxleGFuZHJlIFRvcmd1ZQ0KPiA8YWxl
eGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT47IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz47
IFNhbXVlbA0KPiBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPjsgSGFtbWVyIEhzaWVoDQo+
IDxoYW1tZXJoMDMxNEBnbWFpbC5jb20+OyBKb25hdGhhbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlk
aWEuY29tPjsNCj4gaXdhbWF0c3Ugbm9idWhpcm8o5bKp5p2+IOS/oea0iyDil4vvvKTvvKnvvLTv
vKPilqHvvKTvvKnvvLTil4vvvK/vvLPvvLQpDQo+IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGli
YS5jby5qcD47IFNlYW4gQW5kZXJzb24NCj4gPHNlYW4uYW5kZXJzb25Ac2Vjby5jb20+OyBNaWNo
YWwgU2ltZWsgPG1pY2hhbC5zaW1la0BhbWQuY29tPjsNCj4gSm9oYW4gSG92b2xkIDxqb2hhbkBr
ZXJuZWwub3JnPjsgQWxleCBFbGRlciA8ZWxkZXJAa2VybmVsLm9yZz47IEdyZWcNCj4gS3JvYWgt
SGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBBbmplbGlxdWUgTWVsZW5kZXoN
Cj4gPHF1aWNfYW1lbGVuZGVAcXVpY2luYy5jb20+OyBEbWl0cnkgQmFyeXNoa292DQo+IDxkbWl0
cnkuYmFyeXNoa292QGxpbmFyby5vcmc+OyBMdWNhIFdlaXNzIDxsdWNhQHozbnR1Lnh5ej47IEJq
b3JuDQo+IEFuZGVyc3NvbiA8cXVpY19iam9yYW5kZUBxdWljaW5jLmNvbT47IGxpbnV4LXB3bUB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZzsgYXNh
aGlAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LXJwaS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gY2hyb21lLXBsYXRm
b3JtQGxpc3RzLmxpbnV4LmRldjsgbGludXgtbWlwc0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsNCj4gbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtcm9ja2No
aXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwu
b3JnOw0KPiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tOyBsaW51eC1z
dW54aUBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZzsgZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZzsNCj4gbGludXgtc3RhZ2luZ0BsaXN0cy5saW51eC5k
ZXYNCj4gU3ViamVjdDogW1BBVENIIHYyIDEvMl0gcHdtOiBNYW5hZ2Ugb3duZXIgYXNzaWdubWVu
dCBpbXBsaWNpdGx5IGZvciBkcml2ZXJzDQo+IA0KPiBJbnN0ZWFkIG9mIHJlcXVpcmluZyBlYWNo
IGRyaXZlciB0byBjYXJlIGZvciBhc3NpZ25pbmcgdGhlIG93bmVyIG1lbWJlciBvZg0KPiBzdHJ1
Y3QgcHdtX29wcywgaGFuZGxlIHRoYXQgaW1wbGljaXRseSB1c2luZyBhIG1hY3JvLiBOb3RlIHRo
YXQgdGhlIG93bmVyDQo+IG1lbWJlciBoYXMgdG8gYmUgbW92ZWQgdG8gc3RydWN0IHB3bV9jaGlw
LCBhcyB0aGUgb3BzIHN0cnVjdHVyZSB1c3VhbGx5IGxpdmVzDQo+IGluIHJlYWQtb25seSBtZW1v
cnkgYW5kIHNvIGNhbm5vdCBiZSBtb2RpZmllZC4NCj4gDQo+IFRoZSB1cHNpZGUgaXMgdGhhdCBu
ZXcgbG93bGV2ZWwgZHJpdmVycyBjYW5ub3QgZm9yZ2V0IHRoZSBhc3NpZ25tZW50IGFuZCBzYXZl
DQo+IG9uZSBsaW5lIGVhY2guIFRoZSBwd20tY3JjIGRyaXZlciBkaWRuJ3QgYXNzaWduIC5vd25l
ciwgdGhhdCdzIG5vdCBhIHByb2JsZW0gaW4NCj4gcHJhY3Rpc2UgdGhvdWdoIGFzIHRoZSBkcml2
ZXIgY2Fubm90IGJlIGNvbXBpbGVkIGFzIGEgbW9kdWxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8ICAxIC0NCj4gIGRyaXZlcnMvbGVk
cy9yZ2IvbGVkcy1xY29tLWxwZy5jICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9jb3JlLmMg
ICAgICAgICAgICAgICAgICAgIHwgMjQNCj4gKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+ICBk
cml2ZXJzL3B3bS9wd20tYWI4NTAwLmMgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9w
d20vcHdtLWFwcGxlLmMgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1h
dG1lbC1obGNkYy5jICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tYXRtZWwtdGNi
LmMgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWF0bWVsLmMgICAgICAgICAg
ICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1iY20taXByb2MuYyAgICAgICAgICAgfCAg
MSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tYmNtLWtvbmEuYyAgICAgICAgICAgIHwgIDEgLQ0KPiAg
ZHJpdmVycy9wd20vcHdtLWJjbTI4MzUuYyAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMv
cHdtL3B3bS1iZXJsaW4uYyAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20t
YnJjbXN0Yi5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWNsay5jICAg
ICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1jbHBzNzExeC5jICAgICAg
ICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tY3Jvcy1lYy5jICAgICAgICAgICAgIHwg
IDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWR3Yy5jICAgICAgICAgICAgICAgICB8ICAxIC0NCj4g
IGRyaXZlcnMvcHdtL3B3bS1lcDkzeHguYyAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJz
L3B3bS9wd20tZnNsLWZ0bS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdt
LWhpYnZ0LmMgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1pbWcuYyAg
ICAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20taW14LXRwbS5jICAgICAg
ICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWlteDEuYyAgICAgICAgICAgICAgICB8
ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1pbXgyNy5jICAgICAgICAgICAgICAgfCAgMSAtDQo+
ICBkcml2ZXJzL3B3bS9wd20taW50ZWwtbGdtLmMgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVy
cy9wd20vcHdtLWlxczYyMGEuYyAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3
bS1qejQ3NDAuYyAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20ta2VlbWJh
eS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWxwMzk0My5jICAgICAg
ICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1scGMxOHh4LXNjdC5jICAgICAgICAg
fCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tbHBjMzJ4eC5jICAgICAgICAgICAgIHwgIDEgLQ0K
PiAgZHJpdmVycy9wd20vcHdtLWxwc3MuYyAgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZl
cnMvcHdtL3B3bS1tZWRpYXRlay5jICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9w
d20tbWVzb24uYyAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLW1pY3Jv
Y2hpcC1jb3JlLmMgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1tdGstZGlzcC5jICAg
ICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tbXhzLmMgICAgICAgICAgICAgICAg
IHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLW50eGVjLmMgICAgICAgICAgICAgICB8ICAxIC0N
Cj4gIGRyaXZlcnMvcHdtL3B3bS1vbWFwLWRtdGltZXIuYyAgICAgICAgfCAgMSAtDQo+ICBkcml2
ZXJzL3B3bS9wd20tcGNhOTY4NS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20v
cHdtLXB4YS5jICAgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1yYXNw
YmVycnlwaS1wb2UuYyAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tcmNhci5jICAgICAg
ICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXJlbmVzYXMtdHB1LmMgICAgICAg
ICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1yb2NrY2hpcC5jICAgICAgICAgICAgfCAgMSAt
DQo+ICBkcml2ZXJzL3B3bS9wd20tcnotbXR1My5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJp
dmVycy9wd20vcHdtLXNhbXN1bmcuYyAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdt
L3B3bS1zaWZpdmUuYyAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tc2wy
OGNwbGQuYyAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXNwZWFyLmMgICAg
ICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1zcHJkLmMgICAgICAgICAgICAg
ICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tc3RpLmMgICAgICAgICAgICAgICAgIHwgIDEg
LQ0KPiAgZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAgICAgICAgICB8ICAxIC0NCj4gIGRy
aXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3
bS9wd20tc3RtcGUuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXN1
bjRpLmMgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1zdW5wbHVzLmMg
ICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tdGVncmEuYyAgICAgICAgICAg
ICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAgICAgICAgICAgICB8ICAx
IC0NCj4gIGRyaXZlcnMvcHdtL3B3bS10aWVocnB3bS5jICAgICAgICAgICAgfCAgMSAtDQo+ICBk
cml2ZXJzL3B3bS9wd20tdHdsLWxlZC5jICAgICAgICAgICAgIHwgIDIgLS0NCj4gIGRyaXZlcnMv
cHdtL3B3bS10d2wuYyAgICAgICAgICAgICAgICAgfCAgMiAtLQ0KPiAgZHJpdmVycy9wd20vcHdt
LXZpc2NvbnRpLmMgICAgICAgICAgICB8ICAxIC0NCg0KRm9yIFZpc2NvbnRpOg0KQWNrZWQtYnk6
IE5vYnVoaXJvIEl3YW1hdHN1IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcCA+DQoN
CkJlc3QgcmVnYXJkcywNCiAgTm9idWhpcm8NCg0K

