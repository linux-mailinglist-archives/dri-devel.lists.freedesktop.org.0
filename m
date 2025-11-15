Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D90C60BF7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 23:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5039110E0D0;
	Sat, 15 Nov 2025 22:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.b="Ksjp9XcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E5010E08A;
 Sat, 15 Nov 2025 20:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cisco.com; i=@cisco.com; l=2460; q=dns/txt;
 s=iport01; t=1763238446; x=1764448046;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MFw/Z1Sf8SjzDqIL5mUOFLjLDVfmbv7DCp/A06Y2PGI=;
 b=Ksjp9XcDVa+wd7Pp/ERe7WXm05VvA5LvUpE8m67nFL7SNcwP1xhef1Ju
 mVna/joMTLIDQkxyz0Gss5tvIJ3hN9iKszCsfNigyfad5u7C9RINpwmVl
 X/G7ajrg9lH17WD8fnn+4xkJiVxXwuEFPmqOsN6kTJIR1nNRRYm1Ql/gk
 7aqTK0zMgYhnBew8hJ+WTbDTv1SVvXa1BWyvgd1xCzYRwfTBDrpQOZ5kh
 OuNpgE7/6icKDSRMMKd430bXcFt/8pAfXA8G7IauTS9zYxcl14Q1gIP4e
 ZImTmaeEiBRO9RkRSwZK9fMvyD4EGrOxJp+NShmDqW2iXTDQie+XACUlK g==;
X-CSE-ConnectionGUID: cA71CBt2QMexwfsybnEOYA==
X-CSE-MsgGUID: Pi4MVj9uSq+SG/k/ZR+GXw==
X-IPAS-Result: =?us-ascii?q?A0AuAAD/4Bhp/5MQJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEXBwEBCwGBbVIHghtJiCADhE1fhliCIQOeGoF/DwEBAQ0CUQQBAYUHAoxaA?=
 =?us-ascii?q?iY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZchloBA?=
 =?us-ascii?q?QEBAxIVUhACAQgOCi4xJQIEAQ0FCBqFVAMBAqI0AYFAAooreIEBM4EB4CSBS?=
 =?us-ascii?q?gGIUgGFbjuEPScbgg2BV4IwOD6ERYQTgi8EgiKBDoYnjEyGcVJ4HANZLAFVE?=
 =?us-ascii?q?xcLBwWBIBAzAyAKNC0CFA0QEg8EFgUtHXAMKBIQHxgTYFRAg0kQDAZoDwaBE?=
 =?us-ascii?q?hlJAgICBQIrFTqBaAUBHAYcEgIDAQICOlUNgXcCAgSCHH6BbxsPiTWBCQUoA?=
 =?us-ascii?q?wttPTcGDhsFBIE1BZQeUYIsAYEPgS4OUzCWegGwHwqEHKINF6prmQYiqHQCB?=
 =?us-ascii?q?AIEBQIQAQEGgWg8gVlwFYMiUhkPji0WkxsBtU54AjoCBwsBAQMJk2cBAQ?=
IronPort-PHdr: A9a23:OABDghGQ8JnHbRTKZu40c51GfhMY04WdBeZdwoAsh7QLdbys4NG+e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:MYnEFKNHQbmypl3vrR2UlsFynXyQoLVcMsEvi/4bfWQNrUomhGcGz
 jNOXj+FMv3fZGOnKYggPY+/9hlV7ZaHn4IxTXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WlLlV
 e/a+ZWFZQb8gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/5HUxgdF5FCw8N6EX5A7
 u0SLh0qXznW0opawJrjIgVtrs0nKM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGYwBPjDS0Un1lM/C5skgOasj3rXeDxDo1XTrq0yi4TW5FIrieK3aoGNI7RmQ+1tnxq9m
 GCX4l/gQSo1c9/Y+wDG3UKz07qncSTTHdh6+KeD3vdvjBicyHw7DBwNSUD9r+O0h0KzQNFDL
 FRS/TAhxYA+7k3uQtTjUhmQpH+fogVaVcBdHuE38wKRzbKS5ByWbkAKVDNMZMYrssgeQT0xy
 kTPkcnkCDBiq76JTmrb8a2bxRuzPzQYKSoSaAcATBAZ+J/tuow+gh/UTcpkCOiylNKdJN3r6
 zmOqC57g/AYitQGkvzju1vGmDmr4JPOS2bZ+znqY45s1SsgDKaNbI2z4l+d5vFFRLt1hHHb1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:ua088qr2luRAMKo/Rg6B+gkaV5tkLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H/BEDhex/hHZ4c2/h2AV7QZniWhILOFvAs0WKC+UytJ8SQzJ8m6U
 4NSdkbNDS0NykEsS+Y2nj3Lz9D+qj7zEnAv463pBkdL3AOV0gj1XYENu/xKDwOeOAyP+tDKH
 Pq3Ls+m9PPQwVxUu2LQlM+c6zoodrNmJj6YRgAKSIGxWC15w+A2frRKTTd+g0RfQ9u7N4ZnF
 QtlTaX2oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweBfu1aKv2/lQFwhNvqxEchkd
 HKrRtlFd908Wntcma8pgao8xX80Qwp92TpxTaj8DjeSI3CNXAH4vh69MZkmyjimg0dVRZHoe
 R2Nleixt9q5NX77X3ADpbzJklXfwGP0AofeKYo/g9iuM0lGf5sRUh1xjIOLH/GdxiKs7wPAa
 1gCtrR6+1Rdk7fZ3fFvnN3yNjpRXgrGAyaK3Jy8fB9/gIm1UyR9XFojPA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVaUWVjibGjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DEXElDvWA/dkryAYmF3YFN8BrKXGKhNA6dgP129tx8oPnxVbDrOSqMRBQnlNahuewWBonBV/
 O6KPttconexKvVaPF0NiHFKu1vwCMlIb8oU/4AKieznv4=
X-Talos-CUID: 9a23:Cy/uC2BTw90qasP6EyJOqxc/MNx/S1jQ3GjeOF6yD0tOeZTAHA==
X-Talos-MUID: 9a23:WpS6GwVnZP/HMmDq/Aft2BRcNpZ12L3tM29KktI0gYqrBTMlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
 by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 15 Nov 2025 20:27:25 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 0BFA218000155;
 Sat, 15 Nov 2025 20:27:25 +0000 (GMT)
X-CSE-ConnectionGUID: 9IGLtmi+SbWDArDZBSRfYQ==
X-CSE-MsgGUID: OwvumJ/eRDCics6ueVBrMQ==
Authentication-Results: rcdn-opgw-4.cisco.com;
 dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.19,307,1754956800"; d="scan'208";a="61701058"
Received: from mail-dm5pr08cu00407.outbound.protection.outlook.com (HELO
 DM5PR08CU004.outbound.protection.outlook.com) ([40.93.13.103])
 by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 15 Nov 2025 20:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/Zfi6W5LuTTMhUxXAydYPEJj3UhQ/r7u8BdXcIgbkAPXVDgR/f0IlAeGZ4ZbthcdIkoDOQyTtXRRMXX+0xQGGTlAn4kVUhcSjtcSsono/lh9PItyxzjlA5c8AvTJ75yG5gdnNyACHBSOkWBUCfQ4xma5G5OnNkAKaYcymBUnYa7hkvOhtt5GbI07swmSEGQF2J+6X4+BMq19WQ3fNOhUkFr5cq34QZSx70pee6VqP8x3MZvi9oGeoFf8eyqxsOSYU2fWL1Ka2ULZESAzihOOLjEb2W7vnJJYHk30FUp3H3Dd0+dd18SMk+IdkU7u1li8QZwnzgQA/orW6dXQNLlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFw/Z1Sf8SjzDqIL5mUOFLjLDVfmbv7DCp/A06Y2PGI=;
 b=ejqVQ290Ii4mWw5iKhsOXD8PBvwwHu8O7BnuT7/J6DKsLxVg0KfJzWz33QUM9JTsFUzE6PDEnzszsnM0pIdnOXc72br0NOy9MsyBDdYZqp46yDbHfUWtnjkw+FQU+s52nWUJhTon5oCWQVGbz+4NcjtTFjOyALWSqdYFY8RkKoavntXken2PlB4pIsNJnjNWVFAYP/l5rpVRD8EpU5o6oGDpOwwfPm4mMmacc9IopIJz2ymCEKxCCVK+/y5pmwaq9DfNUhm8dsb/LwWFvTRCeEzeoxpDdhC87EClZ+DS6dfNnEWkpJc8MqBbvJ3/RiqstVlUC5FCdNlNiJMSKyloCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 by DS4PPFE70B31BEF.namprd11.prod.outlook.com (2603:10b6:f:fc02::5a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Sat, 15 Nov
 2025 20:27:20 +0000
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::2081:bcd4:cb3e:e2dd]) by SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::2081:bcd4:cb3e:e2dd%4]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 20:27:19 +0000
From: "Karan Tilak Kumar (kartilak)" <kartilak@cisco.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Corey Minyard
 <corey@minyard.net>, =?iso-8859-2?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Matthew Brost
 <matthew.brost@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Vitaly Lifshits
 <vitaly.lifshits@intel.com>, Manivannan Sadhasivam <mani@kernel.org>, Niklas
 Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Sagi Maimon <maimon.sagi@gmail.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Hans Verkuil
 <hverkuil+cisco@kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, Steven
 Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, Viacheslav
 Dubeyko <Slava.Dubeyko@ibm.com>, Max Kellermann <max.kellermann@ionos.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org"
 <intel-wired-lan@lists.osuosl.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-staging@lists.linux.dev"
 <linux-staging@lists.linux.dev>, "ceph-devel@vger.kernel.org"
 <ceph-devel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?iso-8859-2?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Narsimhulu
 Musini (nmusini)" <nmusini@cisco.com>, Paolo Abeni <pabeni@redhat.com>, Tony
 Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
 <kwilczynski@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, Stefan Haberland <sth@linux.ibm.com>, Jan
 Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, "Satish Kharat (satishkh)" <satishkh@cisco.com>,
 "Sesidhar Baddela (sebaddel)" <sebaddel@cisco.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xiubo
 Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, "Gian Carlo Boffa (gcboffa)"
 <gcboffa@cisco.com>, "Arulprabhu Ponnusamy (arulponn)" <arulponn@cisco.com>
Subject: RE: [PATCH v3 20/21] scsi: snic: Switch to use %ptSp
Thread-Topic: [PATCH v3 20/21] scsi: snic: Switch to use %ptSp
Thread-Index: AQHcVK6i2TuKalB1aEOcW1L+o6TUn7T0MoDA
Date: Sat, 15 Nov 2025 20:27:19 +0000
Message-ID: <SJ0PR11MB58960101609D15FB8F6FB5B2C3CBA@SJ0PR11MB5896.namprd11.prod.outlook.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-21-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251113150217.3030010-21-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5896:EE_|DS4PPFE70B31BEF:EE_
x-ms-office365-filtering-correlation-id: 06dc7afe-7be7-41d7-220d-08de24856052
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?UTyLHl4BJYTK4mtPS91Sw2Srl0NHvlfMZaTqLxu2rUWxwfXqFudlc+5TWZ?=
 =?iso-8859-2?Q?BJrEBNZocoITs1OavCRqzXqvbXtC3nyiTs+X6BNCP++7KlQ2g2MJnYpALp?=
 =?iso-8859-2?Q?Bn5YPtijrc89YM4uqb1zvNiGQUKCmcJm5aV9n2jDlaisDBGoiOEdehli0Z?=
 =?iso-8859-2?Q?AiBZgIYvmeuLyJ94TRvdhfcWNgAInVk2bzv3iJn+ETi2yjnYFqeJDEsP/c?=
 =?iso-8859-2?Q?52tSR8uLyZ/cTHCDYdEy2M4TMyDvk7xp0fRxtDf6gySeGMeb9hFUl3m94o?=
 =?iso-8859-2?Q?9QGxesrQwqKEd/FjIbfevU9AIIu/4425oQt60PEDl2KHxaaeh+AA/kE+If?=
 =?iso-8859-2?Q?cTIhv+ekBi5Kio8han64MSlNeDN+sR6xKhQ/jxgIlLI9yNDFUyww8nWAm5?=
 =?iso-8859-2?Q?SxG/facdPQxoPEpca86hn/+obDhPgWbR/ztj7tbF7ANig0cXm/9lKdnZoZ?=
 =?iso-8859-2?Q?e2S/yQsrsL8JID1eQiuiQr7psiOVeOBrtmr5hP9t6gIIVMZnZvIcwbi1Dc?=
 =?iso-8859-2?Q?pIvEJrA62KfIEsG0lGAYmYo4C0gZHqFgr7DWsaVfEAJWKIQEw+NVLL06fR?=
 =?iso-8859-2?Q?kxKmQM6BCA0FLcSlIScOrAAOBXrkQx8CDVbtdiiK6WgcSEAZeGneow5obu?=
 =?iso-8859-2?Q?DAj3Um0LuFxhd4vwv0VnU/9xHqXWAgIWM8XtzAwyS//bRDdCRnV1M1Ynt3?=
 =?iso-8859-2?Q?a5G+dYsTHrt3OFCJQcrYObQ6i3mZy/rMEXFoSyhPJXNNEdgWxwoB1HncUE?=
 =?iso-8859-2?Q?4rYNimG0/N/xCyPNM8ep24M113OR2BqbeCl3DNYllfbQxGN78FCOYN6ZIE?=
 =?iso-8859-2?Q?phsDl0tQWTOljwdp7051kUzoU0wbE9PpBzs61KFHlB25iEfK2WgEBoV82H?=
 =?iso-8859-2?Q?C3yaXZ0BCTPUNLjRuQmgvzHU5ng4f8VDQtXXPfR+oYzmwJKohYU9q+EL+t?=
 =?iso-8859-2?Q?p41Xg0+NxjykvmlvZM0im3m1zsEQ6O7xp9jzLSW3CSy7Ug4BD8U/f3loX6?=
 =?iso-8859-2?Q?m2dgZ7IV42D8gpPaSgZGxQfxdjuNZF06eztZWNwwtTbG2xJCCy5kJDjABj?=
 =?iso-8859-2?Q?kprDaZzeCplxAQW8xfkkmstWs5hIltTmdYlLszIG41MjqxWZJZpClawbb1?=
 =?iso-8859-2?Q?XipTfYbbjUUTJ5AY/cJ94Ocn6B1jSeJph/3BbItNRMvxRi6ONwCwbBDbP+?=
 =?iso-8859-2?Q?Le6I4IDVHcH5ofHexkpBJuMrroWBuSTjhDDNC3TqJdl72rmfZgLyVoS77N?=
 =?iso-8859-2?Q?yU/NIXbFlb8l9dK8q5jipLd1/FVk4Pp2P60jy+9m9cVnFbtvQjhXDypzeb?=
 =?iso-8859-2?Q?Ko1fH/QTTvV8pcNWJXq7fLf1O2d3JWe1yLLsUfK2TmQq0D5l5DpbB890yC?=
 =?iso-8859-2?Q?BVF/Ar5qTiLG7xggV8j4UXRb++gCvrDvk/yLsnEeOoqoE6pmrgwYAC6qZd?=
 =?iso-8859-2?Q?7sl4WiSn6wVEF9onXMgQmhjZwpqInrPFVmYPD5v5xlZBo9t8R0x2wBdi0r?=
 =?iso-8859-2?Q?1cJFwkDZ8sMDxKKKjLHjDI1tR9ldHAmzEmiKNR0GMuTz2ixBFx6wGgLXzl?=
 =?iso-8859-2?Q?wRoYHekrIzXtWBvjBDW4wBo0MryqgrcAtLVl4aPMAV4isfK9tw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5896.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?mKPbxCR50Zo/kBjFEIBIzbg6Es+ioxMMbEP7y4nJHK5XxBuKmBIhsyNe+c?=
 =?iso-8859-2?Q?P2PSImE1GXaPLwYEl2o0/N61ZqojPjfvrKsOv95iPU39dTSM2smMfyKa+b?=
 =?iso-8859-2?Q?yJ4MGTfyQcIrBV8ERN3vhUzyykJsgm9hEjRp0sYKTEOshqL4DV0ZfF0XIg?=
 =?iso-8859-2?Q?gSDYhrSwytejuBS2OhEKMlIRkHHQ7vytYCaFWfly2CZuaC6WJXN+qiqsDq?=
 =?iso-8859-2?Q?1wx+Flmo+eU+kxwC2S6ohnAeGzoxOeATpzP8czrMmvNgNv2SUtLjE6cpa6?=
 =?iso-8859-2?Q?CclM+6tyecZ4BTj7JPQNb+6McoBOVK2q7+LBl8VLvNUQ7Auam18+LneqCQ?=
 =?iso-8859-2?Q?OdOlDAEMcBPZg8du9cjYXV5ziDfXS8eYRmiGGpRe07zxj+E8FoJ6/CTVMd?=
 =?iso-8859-2?Q?7Kgi/HmvzryfBpo19AiuIOsdQYexfBhlJrLeDouh2L4yI08/Bbbl/kF8S5?=
 =?iso-8859-2?Q?+h6QuqJAMGwbkVFi3H1iqPsWXwLhY+gBMTbRuAnRl3CW/Yqzn1g39aa01o?=
 =?iso-8859-2?Q?cSQBDMI/SLuz65WdsanquiGJtbc/0CizuwL73kKQEb3Npn7di05o36xFWv?=
 =?iso-8859-2?Q?DEHcIldFhQXWwU2/gi5S2mXbMZmMCcyxEChQZkp0IE5lY0kODGyWfdDf2y?=
 =?iso-8859-2?Q?bETAGONsgtujjymUy1NAzor3kNZfB5tXwvpdVhrcAXo6LgPM0rFNGD6A58?=
 =?iso-8859-2?Q?6e/TskoSTgrkkg2uQDl2fzAYuGSIWLRUOariSlHuDDWemN2wBqBA0MUTPl?=
 =?iso-8859-2?Q?hgWCGKJIeDmhFv0/Y6bb+DT1H8rfdgxFfpEsh0+GSrBLTQhdDNi1t12f6f?=
 =?iso-8859-2?Q?XvROYBBSf7yzbEeHNW061lBKryfZqrvEHoMQuxPZKog/eOcdils30zwWnx?=
 =?iso-8859-2?Q?b/g6Qe2gspFfKmOdFOxepWKUsWsbnn8706go1E0uxXQTSvmXBcWwXBiYOd?=
 =?iso-8859-2?Q?XQcuKAqoZHHqw9Fb33/Qls/MseykH+NwDBNjX8o7TzR42pQKLf0HRYYGmb?=
 =?iso-8859-2?Q?0TLbowvsUzqn8Lnw42QWD5zzs9U80/mBCiHgHGcw1sFZXpgtC7b35d9BMt?=
 =?iso-8859-2?Q?zmA+oMzsghS3CdaIpJDV6n6mkI4QAlzbJ3RtlkXKbZ9eyBsA+YLQxaQq7p?=
 =?iso-8859-2?Q?HlVl87dlyRvwiXVa6gN4AxQQFclSPqONjcJ0ONO8DnDed4HSKwTNi5Ck1a?=
 =?iso-8859-2?Q?L2SYeW3kbJ41H7lF8WtreIUTJlevxAXf9H3833F5uA/caq+ev/Kf0FdDGK?=
 =?iso-8859-2?Q?yzS1iLutsB5PRhD1boh2gNU8RNC+6uPW1HLm0zHdUv6O4FqR3bbk/cLXOO?=
 =?iso-8859-2?Q?11lyG2zvkvia2pfWVROOpk8PgmvBHIHfCsIaDBWk9vXHFIgB+XyRPiaTTS?=
 =?iso-8859-2?Q?bsGblhc1scXXBJm6wDK24/nRbjFauqXawoxqAO16Jnavr6awCe+E0I5Ryf?=
 =?iso-8859-2?Q?nqUSFrJWfmemtxmMsGaUrdB9yWH/b6Zh2b4cYt5w+ekjkzVh5jn9WBJH9E?=
 =?iso-8859-2?Q?Dk9asRPl15WV6Ci7yTnuTI0CQdvVNtek4nLjE5XF2Jr3UX0Z/+U8K7i8QQ?=
 =?iso-8859-2?Q?yimx4UwBS+uDjiCMwzI1l50RwO5DpDjuoKLQabZf9rzmCxWZaarV19F+IU?=
 =?iso-8859-2?Q?RR+FiRm8NFYq8q/t4x9gOYsXV9u/TNMndx?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dc7afe-7be7-41d7-220d-08de24856052
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2025 20:27:19.8090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sGSzNOwK5N2JX7LP+uBMy+DCipcCcM2IKRDSemuaKx2VgJ+Cpek7Aeyqj1K9YjSnc1FgC1NdcbLcIoAPUC6Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE70B31BEF
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
X-Mailman-Approved-At: Sat, 15 Nov 2025 22:20:22 +0000
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

On Thursday, November 13, 2025 6:33 AM, Andy Shevchenko <andriy.shevchenko@=
linux.intel.com> wrote:
>
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> drivers/scsi/snic/snic_debugfs.c | 10 ++++------
> drivers/scsi/snic/snic_trc.c     |  5 ++---
> 2 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/scsi/snic/snic_debugfs.c b/drivers/scsi/snic/snic_de=
bugfs.c
> index 9dd975b36b5b..edf3e5ef28a6 100644
> --- a/drivers/scsi/snic/snic_debugfs.c
> +++ b/drivers/scsi/snic/snic_debugfs.c
> @@ -282,8 +282,8 @@ snic_stats_show(struct seq_file *sfp, void *data)
> jiffies_to_timespec64(stats->misc.last_ack_time, &last_ack_tms);
>
> seq_printf(sfp,
> -                "Last ISR Time               : %llu (%8llu.%09lu)\n"
> -                "Last Ack Time               : %llu (%8llu.%09lu)\n"
> +                "Last ISR Time               : %llu (%ptSp)\n"
> +                "Last Ack Time               : %llu (%ptSp)\n"
> "Ack ISRs                    : %llu\n"
> "IO Cmpl ISRs                : %llu\n"
> "Err Notify ISRs             : %llu\n"
> @@ -298,10 +298,8 @@ snic_stats_show(struct seq_file *sfp, void *data)
> "Queue Ramp Down             : %lld\n"
> "Queue Last Queue Depth      : %lld\n"
> "Target Not Ready            : %lld\n",
> -                (u64) stats->misc.last_isr_time,
> -                last_isr_tms.tv_sec, last_isr_tms.tv_nsec,
> -                (u64)stats->misc.last_ack_time,
> -                last_ack_tms.tv_sec, last_ack_tms.tv_nsec,
> +                (u64) stats->misc.last_isr_time, &last_isr_tms,
> +                (u64) stats->misc.last_ack_time, &last_ack_tms,
> (u64) atomic64_read(&stats->misc.ack_isr_cnt),
> (u64) atomic64_read(&stats->misc.cmpl_isr_cnt),
> (u64) atomic64_read(&stats->misc.errnotify_isr_cnt),
> diff --git a/drivers/scsi/snic/snic_trc.c b/drivers/scsi/snic/snic_trc.c
> index c2e5ab7e976c..6bad1ea9a6a7 100644
> --- a/drivers/scsi/snic/snic_trc.c
> +++ b/drivers/scsi/snic/snic_trc.c
> @@ -56,9 +56,8 @@ snic_fmt_trc_data(struct snic_trc_data *td, char *buf, =
int buf_sz)
> jiffies_to_timespec64(td->ts, &tmspec);
>
> len +=3D snprintf(buf, buf_sz,
> -                     "%llu.%09lu %-25s %3d %4x %16llx %16llx %16llx %16l=
lx %16llx\n",
> -                     tmspec.tv_sec,
> -                     tmspec.tv_nsec,
> +                     "%ptSp %-25s %3d %4x %16llx %16llx %16llx %16llx %1=
6llx\n",
> +                     &tmspec,
> td->fn,
> td->hno,
> td->tag,
> --
> 2.50.1
>
>

Thanks for the change, Andy.

Acked-by: Karan Tilak Kumar <kartilak@cisco.com>

Regards,
Karan
