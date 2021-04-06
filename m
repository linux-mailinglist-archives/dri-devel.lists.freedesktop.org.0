Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE66355047
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 11:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3571C89F53;
	Tue,  6 Apr 2021 09:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342A689EAE;
 Tue,  6 Apr 2021 09:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjOancBTC2C+gicnygoi8Uhq3DQjcTjtEUGnQ09mSWIK1Dja8k8erJFm70YY1nsX6TKqF3M2j08zzmbdVmhhEJZpVvt0/f79kSxcroK8ADb5F2yezRXJ4OKzTQn4kbZAvIbMDRVlu2INlIQzGAH7kBA/O/t1FrpFr85z1MkFe7SP48YLLiDQw6uz8NY1cYZAB1Ax8WYo4re4oLqCPlLdAHbjKkf5K1mGwlg596Fdr4aVeMnOBtzSwwInQ6z5RiltJe/yy4lf8ZlbNGeMpP8PYh39XSh5iTAKbTLo7Paqwa61H5J8V+7Awndp4Qab66E4iq4nKxypOzE3xdTz49IyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLk14fnfYipxKL9Zw5tHHc8ymqKftShwvta/eS6Q/w0=;
 b=oQWgklWh94o9oX1LmSCGHo4HHYCrJyGa2pZo4w6RKfRbfYS+GVxhbnoSjhDAYjPY8HhZgmfwV6SdRjlg9dmWFUWKmFQ5CmOupuWq+ydWWP2qz00ci1Ij1drixmrRzF1F93Jxd/cYfd6mF4iAob6U6kL8yCpauRHcZn1WaFdVuO9bE1VMfpeIkHaQRQqzDSkxdkPmT0shhsgK/sAa6HKX+jpZwU3QQ6ibxBPWpYBdAuxMEPn4rCPLyoHESO3WiqqqEYEONcXowqinNTujUtY1I0b2P+JbuQMbpENFRsU+D5aD2/9H9VmZ04X+WqXamhOpcjW9KETgIlVBj9Y8SR2+SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLk14fnfYipxKL9Zw5tHHc8ymqKftShwvta/eS6Q/w0=;
 b=k48kpJEo2xGb7fenJc9GsDPTkMaugwdSn09gbDVGPv2fE+ykc0JrZQLshuIsoh/x751R9YZeU7YDHsGPJSWHMWeJkc+6TYPlvE4qGx8Dgkn9vsI21OPYGeYebDluQoIBR00ngPbHMQa4r9QK5nqIXNBoPQLJTvSMx03EkCwJfi0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 6 Apr
 2021 09:43:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 09:43:13 +0000
Subject: Re: [PATCH 2/8] drm/amdgpu: Remove unused function
 amdgpu_bo_fbdev_mmap()
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7b5a0a55-f845-6d05-3e08-d95d4bffa6d9@amd.com>
Date: Tue, 6 Apr 2021 11:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210406090903.7019-3-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8475:9991:cfb3:4162]
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8475:9991:cfb3:4162]
 (2a02:908:1252:fb60:8475:9991:cfb3:4162) by
 FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Tue, 6 Apr 2021 09:43:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb2f31c-a33d-419d-ce91-08d8f8e0652a
X-MS-TrafficTypeDiagnostic: BL0PR12MB4948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB494807798DA3F98D3D1C0BBE83769@BL0PR12MB4948.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQlIxI4q1T0MWExGw5bY9Cuu844VpFEU/WRZiwlBwL7zQqVqTvek+5mkN9beHR8VfB+iTQHKNRH9MjL4PceoIlZKliYajfmTdxUDzZKOmAETbFRCe533A7sm+rN8JQDtikaYCtWzSoie5O7TNVOEkTr9I7joonNgGWUFR/NE4cLATowlZ9u4dsRUJfAm28+Sowbc1EafNgUoA/InmUTnyYE/Hq/4vCctP6uix+yikpoPEiHtaPHk7twLpyPjfOgUFOc7DiWqgs+jjMqkejaq5DlGElsjziLKLTHSuMhwLpKFktZrCB1S57/MmrMFlf6SnOlu5tFgSLERpbYa73k60IMIKeqDPQIqaNG9TNpIQaJA6uRqCWrs9FKEtn2nuFOghAldWybEf36YVQEWOLJofbKm+JkvvoJZ8NXo3uCDb9WiPHvSWcxKbayDcIbfFf15Frn2VfIPCE+J1mXPIf0W73Vo5dvgRWPePDCqOxtooRPUhsK98pFS0l8Y40qKDFLBDxmQeqUEdUyuYxH/AQi8a/Q8nCMYh0asJTjQ3Bfhwmy8iQ/KT+R0lQ9qe4sMquEKXdCfp85LuU3rDc0hrhx/c81bf8+dY24SIZ53p1YEHWeZccEMo86zbjTfuI396mXxwgwKx+mjyK6wLOmbAuwSkhMb1PqejMKKuC/PpPhZdxIg7OOVV3nCT9Ne5ywKDc1ufg5vAn0+ikgv5230OworpIgQtEz+wBLy/4rekqChtsmDfABD+b6DjdEYPvt/ZZzU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(396003)(136003)(366004)(376002)(7416002)(6636002)(83380400001)(2616005)(478600001)(16526019)(52116002)(66476007)(6486002)(5660300002)(316002)(4326008)(66946007)(186003)(8676002)(8936002)(38100700001)(66574015)(31686004)(2906002)(921005)(31696002)(36756003)(66556008)(6666004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nlh6Q0dIY2ZGb2RidXZvcUpKNlYwOEhiK2dKUGlUWW51aHBQSDlDUzRqZmNM?=
 =?utf-8?B?elB3RzJKdnkzMHpNbkpiL1ltYkJBVTdsT2Fqc1BhczZMWkQxMzRKbHJaNmtR?=
 =?utf-8?B?Ylo5Wmhqb2dNMlRKVit1eXpnSFpjbnBDdGp5eWpmZ0NjY2VVQ1Y3ZndNdFlD?=
 =?utf-8?B?bktMdkN4eFpQL3MyblZ2ZjUrSVF2bmwxdWZLYU5oa1VsYUsySVcxL3BFMTNW?=
 =?utf-8?B?OGhzOWM3NnJCNFcrUlZFMi9nUWdGMGJEMnByYmthUS8zSmdRL2RBUWs2K2hx?=
 =?utf-8?B?Uno4MHRubU5nYmpPaEpZVlpvRUUvVG9OdnVXcjV2ekk3dllTZjBXaWwvSW94?=
 =?utf-8?B?Ny8zeUpsS0dqbjllUTVPRzlaWEx0QWNwYlF6V2tGQi9aNzlTVTJlOW5jbHJa?=
 =?utf-8?B?YlY2Vm9pdXl5RVo2bUdXamlaNXBUbzZSeFErbHIxZlpWRnVwS1BkM01vcksr?=
 =?utf-8?B?OHhhK3F0NVVJdVVsZmNhaE9MWlA3ajFUSG9wU1FWN0RpWExXZ0NGbUYwSlZX?=
 =?utf-8?B?Nkx6K2VyRkhqQUgvQ3I1QjBSckpPZHVZQTVyaE5MZmd3MzFoN1JGSGVTaE1k?=
 =?utf-8?B?ZVE5Y3hrK2lhNU4ycVhVWlp3RDA5THZubVNvUTMwVW9WYUdLNEFwUGJZRVhC?=
 =?utf-8?B?M0dZQmVhRXRGUitxUlFuc0ZjNXY3c1k5azBudGdPN2tXQ0pZcXRDZUpSTmVh?=
 =?utf-8?B?bHd4b291d1lmQXFmdUM5YklPUVFDSlhnajcyeW9oaFJ0K1R6ZDJlei9JOGc2?=
 =?utf-8?B?dDlBaUhnUHQ4cWx5QzU0cXdxK2pHajF2bzJiakZiellzQjkvcTBCOW16Mlhu?=
 =?utf-8?B?R1A1WWZvZjRYNzFJbEd6VFFZVkE2cm84TTk0VXpCZTJuSFlhWU5FQkdEL0d6?=
 =?utf-8?B?YityMjZDTFlOQ0JpU1pCMDBhWFJsNEVBUi9EVExDOGdQSXBiRWYxWHp2WjBM?=
 =?utf-8?B?Qm9oZ3JyMzhqZW4yMGxvUENYMGxVQ2FXSlUvUUt3MnVzTHZEV1Q4VzBCQWRz?=
 =?utf-8?B?UXFFbVFRR3NaZmxFb3RMSUdoRndJdmUvNWM1dlF0WElQTkJaZDh6Q3JRSkQ2?=
 =?utf-8?B?U1hhcTg3N1g3MDVadkQ5UTZkUmsvOXE5Q3lla1NnanNNVlJYVTl6V2ZYUWxi?=
 =?utf-8?B?V2tCaFlmam9ZdklVcHVDMWppVUtUZnJXSk5wc1pFS1JPVUZWamxJTXl1VWM1?=
 =?utf-8?B?ckV1azdhc054WHJ1Y2ZoL3BuUk0wS1BBZ3o2NXp0TERYU3JIZy95QzYzMGcy?=
 =?utf-8?B?TzJDOU13akZPWkowZW9jU25mSHhRTDlZSEtpL0Z5TGFNdmJzTUxnWjNpUHJl?=
 =?utf-8?B?VUhIUzczakg3WW15YVY5MjBCNlhGeGlhUHlvcEIxZHBTYXFBdmMrcmFYVTZD?=
 =?utf-8?B?WHR2VUpuNFlSMCtydUtrZXRZM0VNWkpGN1BwaWhVUzlrZm0rdnZ4N0VrOVND?=
 =?utf-8?B?Vk5kWHVsa2duaVFoSCt5Qnh5dks5Y3k3V1M5a0NIK0hxb1NyclE2MDJCcTBS?=
 =?utf-8?B?SzRhNmhMdytMclBRK2pET0lEb3VNU0MzdFdFc3p4L2lBZEhJR3dKNWp4SzJN?=
 =?utf-8?B?b29ZdW93UVI1OHJqWThWU0JmQjJUb2ovRGp1TTF0RW9FQVRqQTZaOFA4eWhX?=
 =?utf-8?B?ak83YUQ1dmI3RW9WbHlHdUlSM1B2SkJLQjhvOXZEc2xNdTRQN3N2Uk11bnBM?=
 =?utf-8?B?MzFJc0kwQjRSVFJoMytNQ1Q1WTRHWFhVMnhYK2Y2ckFiclBuSGkxc0RkTEFT?=
 =?utf-8?B?b3hKUm5RcnlUYnlKR2dvOFNYNUphZFkzdEo0K1RCOVJkVTYvQU5udU52V0ZU?=
 =?utf-8?B?RXpYT2VyWi9zT0NzM1kzTzUyQVFqN1dxdS9aZzhqc3U2OE11MWovaVdTS2Fl?=
 =?utf-8?Q?2KHUj/EC/ieGS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb2f31c-a33d-419d-ce91-08d8f8e0652a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 09:43:13.0549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5MqviGOYFghgOuinyilqTy0QrcD1hyWg3Bl+ZltJbJ3atwqkaCkzf+GDSCmbgfW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4948
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMDQuMjEgdW0gMTE6MDggc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBSZW1vdmUg
YW4gdW51c2VkIGZ1bmN0aW9uLiBNYXBwaW5nIHRoZSBmYmRldiBmcmFtZWJ1ZmZlciBpcyBhcHBh
cmVudGx5Cj4gbm90IHN1cHBvcnRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KClNob3VsZCBJIGp1c3QgdXBzdHJlYW0gdGhpcyB0
aHJvdWdoIG91ciBpbnRlcm5hbCBicmFuY2hlcz8KClRoYW5rcywKQ2hyaXN0aWFuLgoKPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDE5IC0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuaCB8ICAyIC0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+IGluZGV4IGI5OWU5ZDg3
MzZjMi4uY2ZjODkxNjRkZWU4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9vYmplY3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuYwo+IEBAIC0xMDkyLDI1ICsxMDkyLDYgQEAgdm9pZCBhbWRncHVfYm9fZmlu
aShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAl9Cj4gICB9Cj4gICAKPiAtLyoqCj4g
LSAqIGFtZGdwdV9ib19mYmRldl9tbWFwIC0gbW1hcCBmYmRldiBtZW1vcnkKPiAtICogQGJvOiAm
YW1kZ3B1X2JvIGJ1ZmZlciBvYmplY3QKPiAtICogQHZtYTogdm1hIGFzIGlucHV0IGZyb20gdGhl
IGZiZGV2IG1tYXAgbWV0aG9kCj4gLSAqCj4gLSAqIENhbGxzIHR0bV9mYmRldl9tbWFwKCkgdG8g
bW1hcCBmYmRldiBtZW1vcnkgaWYgaXQgaXMgYmFja2VkIGJ5IGEgYm8uCj4gLSAqCj4gLSAqIFJl
dHVybnM6Cj4gLSAqIDAgZm9yIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZh
aWx1cmUuCj4gLSAqLwo+IC1pbnQgYW1kZ3B1X2JvX2ZiZGV2X21tYXAoc3RydWN0IGFtZGdwdV9i
byAqYm8sCj4gLQkJCSAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gLXsKPiAtCWlm
ICh2bWEtPnZtX3Bnb2ZmICE9IDApCj4gLQkJcmV0dXJuIC1FQUNDRVM7Cj4gLQo+IC0JcmV0dXJu
IHR0bV9ib19tbWFwX29iaih2bWEsICZiby0+dGJvKTsKPiAtfQo+IC0KPiAgIC8qKgo+ICAgICog
YW1kZ3B1X2JvX3NldF90aWxpbmdfZmxhZ3MgLSBzZXQgdGlsaW5nIGZsYWdzCj4gICAgKiBAYm86
ICZhbWRncHVfYm8gYnVmZmVyIG9iamVjdAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfb2JqZWN0LmgKPiBpbmRleCA1NGNlYjA2NWU1NDYuLjQ2ZTk0ZDQxM2M1YyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKPiBAQCAtMjY4LDgg
KzI2OCw2IEBAIHZvaWQgYW1kZ3B1X2JvX3VucGluKHN0cnVjdCBhbWRncHVfYm8gKmJvKTsKPiAg
IGludCBhbWRncHVfYm9fZXZpY3RfdnJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4g
ICBpbnQgYW1kZ3B1X2JvX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+ICAgdm9p
ZCBhbWRncHVfYm9fZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4gLWludCBhbWRn
cHVfYm9fZmJkZXZfbW1hcChzdHJ1Y3QgYW1kZ3B1X2JvICpibywKPiAtCQkJCXN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKTsKPiAgIGludCBhbWRncHVfYm9fc2V0X3RpbGluZ19mbGFncyhzdHJ1
Y3QgYW1kZ3B1X2JvICpibywgdTY0IHRpbGluZ19mbGFncyk7Cj4gICB2b2lkIGFtZGdwdV9ib19n
ZXRfdGlsaW5nX2ZsYWdzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCB1NjQgKnRpbGluZ19mbGFncyk7
Cj4gICBpbnQgYW1kZ3B1X2JvX3NldF9tZXRhZGF0YSAoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHZv
aWQgKm1ldGFkYXRhLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
