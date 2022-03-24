Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE844E5FC0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 08:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CBA10E857;
	Thu, 24 Mar 2022 07:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com
 [203.205.221.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0908010E867
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1648108388;
 bh=4qRt4CTUnFYdz91fm463A4eMLDDhGfe23h62hXzxysA=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date;
 b=tUHNRt1lMZlXuR8fjknENly3lXZ0VQhtl0SlICeCMNP9g+83T1TVYMe8ybWCVbn6T
 iBcmr5+FYCI8KR9M4vR6DsdQpoY4vpNBRrETlTP5t4TieeCesaevG9m34oz94P/wbY
 SBljOTNC2DaLUhjA64Tf7Bnv9wNNtHCfTUiAs284=
X-QQ-FEAT: oHWrrGTW1dA7H/rBCZjy5XfNuaD0tECu
X-QQ-SSF: 00000000000000F000000000000000Z
X-QQ-XMAILINFO: MDPfhejMR4aIPs8Cf+y1mMj67XUkSWBvQJOfP8jngt07e0MRHVoxpW/lKa1yQt
 55NE9KviXEVi7x7uXkPfaluN3fFG6NKiWCz4L6cHEUqCzEJBXTBlEYxmmwKEweT8EUwjin5YpiygD
 BPnk2hDjka/tGZrXvqnWm7VM0anLtH9jpRGEmJJ9SudcHOKcH3VUtyyjHIhVMjIqMAWRrATJNWIck
 d4N1Ba2lmAKpV/+6iXDUkz1Z8F4CJPTL9xvqa40Aa4O3o8P6wdveQgvSrAnx8Jfr6HYwSpN7WItf/
 ZFlDv+ik5XbQ2WWnbfzUBp4CbIDTnJWXyKimICZP4Cko7NX3wMIFcP3aQxrL4lM2fbeOxLBkyU+lI
 A/BowrLGj0CtWL40UqtdmGXZUM2ekhhpan2R1jI+6c0dJX8IR0HuOTTGXabZPrlSLfwWQ2y+bpmrN
 0zA+WS58NURFA63d4YkukxaxeVVgdMbZNZZEyTLw8X8ATHL1zBSCZuKJWuGfD3jxJesXI756+G8M2
 qR33NhD1pa0rGsOm954u4ye/ulPy43jabn2oczWRWuNV5h6Cs5LeG/pvU80AKa3XO4h4RtbBGeDYh
 8BbwP22iwPujkvMXqavamc54TcxKv6i92r64BuTPSfkJrdadYca0VUr9uy4tS9hIpLkWAGNuDrGab
 4StF5PUi/4duoASWVjgm2O5xoptbX5OrJUFI2LHuEgm0TZAmnlmhxR2HsnS3XLPx5UwqeKoZ+evXU
 5tQ9fh8MbKMkchmeKzdaCJe/Aa4ot/WkjX89P9rXd12l0VI2pMHv7ps6D5UpkIpXOn+tsr79+u0gt
 z4Kumyl/zggqfkaF7Oga2a3wtWBPTplz/fCfmA8rNj4ZI+9FAcLnwrtRelU7xgqHMf3b6VCu0B9Wt
 8bxkRpBwyGiXiRJiZ0BNNpPHeXY+zw/N6THPfsKcB1xbnKwZpzoPGtnCADxVeUcHnIgDgnpDVs=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 111.47.122.156
In-Reply-To: <tencent_92B89C12C6BF29881C73666E140718054E06@qq.com>
References: <tencent_92B89C12C6BF29881C73666E140718054E06@qq.com>
X-QQ-STYLE: 
X-QQ-mid: webmail813t1648108322t29954
From: "=?ISO-8859-1?B?WGlhb2tlIFdhbmc=?=" <xkernel.wang@foxmail.com>
To: "=?ISO-8859-1?B?eGtlcm5lbC53YW5n?=" <xkernel.wang@foxmail.com>
Subject: Re:[PATCH] drm: mali-dp: check the return value of kzalloc()
Mime-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64
Date: Thu, 24 Mar 2022 15:52:02 +0800
X-Priority: 3
Message-ID: <tencent_283D88183356EE2B0706054EB8B452C3FF06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
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
Cc: =?ISO-8859-1?B?YWlybGllZA==?= <airlied@linux.ie>,
 =?ISO-8859-1?B?bGl2aXUuZHVkYXU=?= <liviu.dudau@arm.com>,
 =?ISO-8859-1?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
 =?ISO-8859-1?B?ZHJpLWRldmVs?= <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGh1LCAyNCBNYXIgMjAyMiAxNDo0MzoxNyArMDgwMCwgeGtlcm5lbC53YW5nQGZveG1haWwu
Y29tIHdyb3RlOgoKJmd0OyBremFsbG9jKCkgaXMgYSBtZW1vcnkgYWxsb2NhdGlvbiBmdW5j
dGlvbiB3aGljaCBjYW4gcmV0dXJuIE5VTEwgd2hlbgomZ3Q7IHNvbWUgaW50ZXJuYWwgbWVt
b3J5IGVycm9ycyBoYXBwZW4uIFNvIGl0IGlzIGJldHRlciB0byBjaGVjayBpdCB0bwomZ3Q7
IHByZXZlbnQgcG90ZW50aWFsIHdyb25nIG1lbW9yeSBhY2Nlc3MuCgpXaXRoZHJhdyB0aGlz
LiBUaGUgb3JpZ2luYWwgY29kZSBpcyBhbHNvIGZpbmUgc2luY2UgdGhlcmUgaXMgYSB2YWxp
ZCBjaGVjawppbnNpZGUgX19kcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoKSBi
dXQgSSBtaXNzZWQgdG8gdHJhY2sgaXQu

