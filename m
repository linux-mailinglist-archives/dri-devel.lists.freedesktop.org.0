Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07499817CF6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 22:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D08F10E2A3;
	Mon, 18 Dec 2023 21:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8079 seconds by postgrey-1.36 at gabe;
 Mon, 18 Dec 2023 20:36:27 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FE310E394
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1702931778; x=1703536578; i=t.luettecken@web.de;
 bh=tQhoNzBI3JAACn0q2LhpVchW3A3JYIyc5Wf36EOU9CI=;
 h=X-UI-Sender-Class:Date:To:From:Subject;
 b=jhXlM9RVS7y4MyOMXUqhWTZ7VOkCAhpsP2jbE64GFHppnnNMKurU86RN+UWVaFVZ
 AjzTt+Vj2eZUaC7/y7j74uAi5S9aT3UcWqVjRTyzyNesbsEhZqxE8xw341TOB8Oic
 Pq1pZtNoykmzEhooZRDabJL5VpX70YKl2O15RSKKSzdHDSi73f93JxI84caIEKh2J
 k3nT0KQBRhdSVUHGstGmY87mAt5AuOXwDQNGgT7nZop0klWgnUsp1FmXO7qzji9sn
 JcMLX0p1lf6xOkCGWlvai9X618RMsi3eWigMvwPsnBFdb1MyUUUbjy/ClnltJDM4I
 PZxfIX7/sphTs8r79g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.42] ([84.151.224.123]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLijs-1rWl5f18Xg-00I6bz for
 <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 15:02:51 +0100
Message-ID: <494cba52-2a19-e2dd-8a88-bc304f729889@web.de>
Date: Mon, 18 Dec 2023 15:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: dri-devel@lists.freedesktop.org
Content-Language: de-DE
From: Thomas <t.luettecken@web.de>
Subject: enforce the Display Stream Compression
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gA7RZ34CO/1I07bXy13mUp++SmO/+3ZO3v/wHT0g95+uJ4ZZDF+
 XkcZzPZCmECkKiEWOz2T5CsVyvp+BkcSdZQKCYSWkaB4IhGFpjv0lDe7iMHgnEqJQXKSQW0
 qiC0dy1Nwpu3v8aqjsqw7xW8B+EVsqUsrgsI124wktBVbj7qJQ5rceZ/7KdwBS727MtkoKr
 0oc1Grh4nfyTqcWzQUySg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:reke+Tb2ucI=;hv6ZAcLMnsaFHEf6rbpGQI3IJmU
 awcg9IrCGCRw6KGuN36WzcpqPqRsEQQ+ZMjhru0OwyM9lwNPyWnVu1e+/8JEXZfh48Kp+as8F
 CIHknTqKh2F2Bp43W6BeDNkYU9uqLQHKiChtQuIp1/L7lLLAi5Cr7dTjvkynsgVBL8ENuwmti
 Lr7IUEwHCtpd5HcsOOk8YxizI76cMhPz8xL8q13PNP3SLDvGDMFGLYCtaw4LtECVnyEPh4YO2
 bFN/jNeWH3Xk3Mz7zF48Lv9YqMos6S0HLu6zqSGZfL3ZfqvslwMeXgRwEpEYyh/vtD4hfR2Sq
 i1J3IAb7UGplLr7fdVmRIAoV35hn1C01jItXjRDeW312QmkCV09zZQNhJy9Sxei7l/nwpCyfb
 vQaKY0mAJUiBofGZOA9AYn+8UhA7fjxH60fbb7R1wHOP0Qj6f5SSMaVUPuEGBXqMxIvgAM/BV
 /hY4ESst636K3QP+k2gpN2uH+RABPeBHL8oYRCOlBj3vpFWoWsJn+FfzHVpWOD3kjMw7b2m7C
 gtPhVEMm6+J9aTjyJ4cFMUHsvITWWnZGJ/W5+DM5Wf82vFdsNdN3iAkcNyra3+oNKcfKUZugt
 UOLomHjgihgjXek61yeqDBWCnG2A2WQI1rZ02RX3kvEZu3zhnuleEN7dGunzaErV0JTYxFxqt
 NEgG38T+fvhzGRxSBiI1uag82iSBuu1uXqIRZlpxq8RAk+g+LuTqWJvlWYhYqvuVOmMQr4hC5
 fxwJ9k+ZNBYXziSWGmAXtBvStkUh67hMampS8BuFxST6spSdlOlppHqaKhlo7n1Oo/+koT/Cf
 VVZ/ont5USa1lx5ulHi5PIWtKoiWOH1tmExj1NcN7BFdYrqhQszw9cFYc06HiP5/qGY1xVfeN
 a5AxSh1/kQ6LDf06+9duBUwiuPcfewWcXkBunKMBwjfP3a18JTD31i9CsU4C4o3joIUeJyeCQ
 uY9zzg==
X-Mailman-Approved-At: Mon, 18 Dec 2023 21:52:28 +0000
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

Hi,


I want to enforce the Display Stream Compression (DSC) of the Intel i915
driver in Linux Ubuntu 22.04 to test it. While inspecting the source
code, I came across a query called "force_dsc_output_format" that seems
useful to me. My question is more general and pertains to the procedure
for setting such queries/switches. How can I set this query to True to
force DSC? Do I need to modify the kernel parameter line, and if so,
how? Or is there another method?


Kind regards,


Thomas

